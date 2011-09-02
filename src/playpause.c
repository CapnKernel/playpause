/* Name: playpause.c
 * Project: Playpause, based on hid-mouse, a very simple HID example
 * Author: Christian Starkjohann (hid-mouse)
 * Author: Mitch Davis (Playpause)
 * Creation Date: 2008-04-07
 * Tabsize: 4
 * Copyright: (c) 2008 by OBJECTIVE DEVELOPMENT Software GmbH
 * License: GNU GPL v2 (see License.txt), GNU GPL v3 or proprietary (CommercialLicense.txt)
 * This Revision: $Id: main.c 790 2010-05-30 21:00:26Z cs $
 */

/*
This example should run on most AVRs with only little changes. No special
hardware resources except INT0 are used. You may have to change usbconfig.h for
different I/O pins for USB. Please note that USB D+ must be the INT0 pin, or
at least be connected to INT0 as well.

We use VID/PID 0x046D/0xC00E which is taken from a Logitech mouse. Don't
publish any hardware using these IDs! This is for demonstration only!
*/

#include <avr/io.h>
// FIXME: Do we really need to write it back if we can derive it
// each time?  Seems like a good way to wear out the EEPROM.
#include <avr/eeprom.h>
#include <avr/wdt.h>
#include <avr/interrupt.h>  /* for sei() */
#include <stdbool.h>
#include <util/delay.h>     /* for _delay_ms() */

#include <avr/pgmspace.h>   /* required by usbdrv.h */
#include "usbdrv.h"
#include "oddebug.h"        /* This is also an example for using debug macros */

#if defined(__AVR_ATtiny85__) || defined(__AVR_ATtiny45__) || defined(__AVR_ATtiny25__)
/* ------------------------------------------------------------------------- */
/* ------------------------ Oscillator Calibration ------------------------- */
/* ------------------------------------------------------------------------- */
// section copied from EasyLogger
/* Calibrate the RC oscillator to 8.25 MHz. The core clock of 16.5 MHz is
 * derived from the 66 MHz peripheral clock by dividing. Our timing reference
 * is the Start Of Frame signal (a single SE0 bit) available immediately after
 * a USB RESET. We first do a binary search for the OSCCAL value and then
 * optimize this value with a neighboorhod search.
 * This algorithm may also be used to calibrate the RC oscillator directly to
 * 12 MHz (no PLL involved, can therefore be used on almost ALL AVRs), but this
 * is wide outside the spec for the OSCCAL value and the required precision for
 * the 12 MHz clock! Use the RC oscillator calibrated to 12 MHz for
 * experimental purposes only!
 */
static void calibrateOscillator(void)
{
	uchar       step = 128;
	uchar       trialValue = 0, optimumValue;
	int         x, optimumDev, targetValue = (unsigned)(1499 * (double)F_CPU / 10.5e6 + 0.5);

    /* do a binary search: */
    do{
        OSCCAL = trialValue + step;
        x = usbMeasureFrameLength();    /* proportional to current real frequency */
        if(x < targetValue)             /* frequency still too low */
            trialValue += step;
        step >>= 1;
    }while(step > 0);
    /* We have a precision of +/- 1 for optimum OSCCAL here */
    /* now do a neighborhood search for optimum value */
    optimumValue = trialValue;
    optimumDev = x; /* this is certainly far away from optimum */
    for(OSCCAL = trialValue - 1; OSCCAL <= trialValue + 1; OSCCAL++){
        x = usbMeasureFrameLength() - targetValue;
        if(x < 0)
            x = -x;
        if(x < optimumDev){
            optimumDev = x;
            optimumValue = OSCCAL;
        }
    }
    OSCCAL = optimumValue;
}
/*
Note: This calibration algorithm may try OSCCAL values of up to 192 even if
the optimum value is far below 192. It may therefore exceed the allowed clock
frequency of the CPU in low voltage designs!
You may replace this search algorithm with any other algorithm you like if
you have additional constraints such as a maximum CPU clock.
For version 5.x RC oscillators (those with a split range of 2x128 steps, e.g.
ATTiny25, ATTiny45, ATTiny85), it may be useful to search for the optimum in
both regions.
*/

void usbEventResetReady(void)
{
    calibrateOscillator();
    eeprom_update_byte(0, OSCCAL);   /* store the calibrated value in EEPROM */
}
#endif

PROGMEM char usbHidReportDescriptor[USB_CFG_HID_REPORT_DESCRIPTOR_LENGTH] = { /* USB report descriptor */
	0x05, 0x0C, // Usage Page (Consumer Devices)
	0x09, 0x01, // Usage (Consumer Control)
	0xA1, 0x01, // Collection (Application)
    0x14,       /*      Logical Minimum (0),                */
    0x25, 0x01, /*      Logical Maximum (1),                */
    0x19, 0xB5, /*      Usage Minimum (Scan Next Track),    */
    0x29, 0xB7, /*      Usage Maximum (Stop),               */
    0x09, 0xB8, /*      Usage (Eject),                      */
    0x09, 0xCD, /*      Usage (Play Pause),                 */
    0x09, 0xE2, /*      Usage (Mute),                       */
    0x09, 0xE5, /*      Usage (Bass Boost),                 */
    0x09, 0xE7, /*      Usage (Loudness),                   */
    0x95, 0x08, /*      Report Count (8),                   */
    0x75, 0x01, /*      Report Size (1),                    */
    0x81, 0x02, /*      Input (Variable),                   */
	0xC0        // End Collection
};

#define MM_NEXTTRACK    0
#define MM_PREVTRACK    1
#define MM_STOP         2
#define MM_EJECT        3
#define MM_PLAYPAUSE    4
#define MM_MUTE         5
#define MM_BASSBOOST    6
#define MM_LOUDNESS     7

static uchar    reportBuffer;    /* report buffer for keys */
static uchar    idleRate;        /* in 4 ms units */
// True means button is down
static bool     lastButtonReading = false;

static void buildReport(bool buttonDown)
{
    reportBuffer = 0;
    // Set the pause key bit accordingly
    if (buttonDown)
        reportBuffer |= _BV(MM_PLAYPAUSE);
}

usbMsgLen_t usbFunctionSetup(uchar data[8])
{
	usbRequest_t    *rq = (void *)data;

    /* The following requests are never used. But since they are required by
     * the specification, we implement them in this example.
     */
    if((rq->bmRequestType & USBRQ_TYPE_MASK) == USBRQ_TYPE_CLASS){    /* class request type */
        DBG1(0x50, &rq->bRequest, 1);   /* debug output: print our request */
        if(rq->bRequest == USBRQ_HID_GET_REPORT){  /* wValue: ReportType (highbyte), ReportID (lowbyte) */
            /* we only have one report type, so don't look at wValue */
            usbMsgPtr = (void *)&reportBuffer;
            return sizeof(reportBuffer);
        }else if(rq->bRequest == USBRQ_HID_GET_IDLE){
            usbMsgPtr = &idleRate;
            return 1;
        }else if(rq->bRequest == USBRQ_HID_SET_IDLE){
            idleRate = rq->wValue.bytes[1];
        }
    }else{
        /* no vendor specific requests implemented */
    }
    return 0;   /* default for not implemented requests: return no data back to host */
}

/* ------------------------------------------------------------------------- */

int __attribute__((noreturn)) main(void)
//int main(void)
{
    // Set PB4 as an input
    DDRB &= ~_BV(PB4);
    // Turn on the internal 10k pullup
    PORTB |= _BV(PB4);

    wdt_enable(WDTO_1S);
    /* Even if you don't use the watchdog, turn it off here. On newer devices,
     * the status of the watchdog (on/off, period) is PRESERVED OVER RESET!
     */
    /* RESET status: all port bits are inputs without pull-up.
     * That's the way we need D+ and D-. Therefore we don't need any
     * additional hardware initialization.
     */
    odDebugInit();
    DBG1(0x00, 0, 0);       /* debug output: main starts */
    usbInit();

    /* fake USB disconnect for > 250 ms */
    usbDeviceDisconnect();  /* enforce re-enumeration, do this while interrupts are disabled! */
    uchar i = 0;
    while (--i)
    {
        wdt_reset();
        _delay_ms(1);
    }
    usbDeviceConnect();

    sei();
    DBG1(0x01, 0, 0);       /* debug output: main loop starts */

    for (;;)
    {
        /* main event loop */
        DBG1(0x02, 0, 0);   /* debug output: main loop iterates */
        wdt_reset();
        usbPoll();
        if (usbInterruptIsReady())
        {
            /* called after every poll of the interrupt endpoint */
            bool thisButtonReading = !(PINB & _BV(PB4));

            // Has the button value changed since last time?
            if (thisButtonReading != lastButtonReading)
            {
                // Yes, so construct a report and send it.
                buildReport(thisButtonReading);
				usbSetInterrupt((void *)&reportBuffer, sizeof(reportBuffer));
			}
			else
            {
                // No change.
				usbSetInterrupt((void *)&reportBuffer, 0);
            }

            lastButtonReading = thisButtonReading;
        }
    }
}

