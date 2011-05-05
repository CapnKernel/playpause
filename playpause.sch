EESchema Schematic File Version 2  date Wed 04 May 2011 01:09:04 PM EST
LIBS:playpause
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:contrib
LIBS:valves
LIBS:atmel
LIBS:atmel2
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
Sheet 1 1
Title "Playpause"
Date "4 may 2011"
Rev "v1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 3850 1800
Wire Wire Line
	3850 1700 3850 2050
Connection ~ 4850 2750
Wire Wire Line
	4850 2750 4850 2450
Wire Wire Line
	4850 2450 4950 2450
Wire Wire Line
	8350 2050 8350 1800
Wire Wire Line
	8350 1800 3850 1800
Connection ~ 3850 2050
Wire Wire Line
	3700 2350 3850 2350
Wire Wire Line
	3700 2150 4950 2150
Connection ~ 3850 2750
Wire Wire Line
	3850 2350 3850 2850
Connection ~ 4050 2750
Connection ~ 4050 2250
Wire Wire Line
	4050 2350 4050 2250
Wire Wire Line
	5500 2050 5650 2050
Wire Wire Line
	4350 2350 4350 2150
Connection ~ 4350 2150
Wire Wire Line
	5650 2250 4900 2250
Wire Wire Line
	3700 2250 4400 2250
Wire Wire Line
	4400 2050 3700 2050
Wire Wire Line
	4950 2150 4950 2050
Wire Wire Line
	4900 2050 5000 2050
Connection ~ 4950 2050
Wire Wire Line
	3850 2750 8350 2750
Wire Wire Line
	8350 2750 8350 2550
Connection ~ 4350 2750
Wire Wire Line
	5550 2450 5650 2450
$Comp
L +5V #PWR01
U 1 1 4DC0A8D9
P 3850 1700
F 0 "#PWR01" H 3850 1790 20  0001 C CNN
F 1 "+5V" H 3850 1790 30  0000 C CNN
	1    3850 1700
	1    0    0    -1  
$EndComp
$Comp
L ATTINY85-S IC1
U 1 1 4DC0A61F
P 5850 1950
F 0 "IC1" H 5950 2000 60  0000 C CNN
F 1 "ATTINY85" H 7850 1200 60  0000 C CNN
F 2 "SO8-200" H 6100 1200 60  0001 C CNN
	1    5850 1950
	1    0    0    -1  
$EndComp
Text Label 3750 2050 0    60   ~ 0
+5V
Text Label 3750 2150 0    60   ~ 0
D-
Text Label 3750 2350 0    60   ~ 0
GND
Text Label 3750 2250 0    60   ~ 0
D+
$Comp
L GND #PWR02
U 1 1 4D30857F
P 3850 2850
F 0 "#PWR02" H 3850 2850 30  0001 C CNN
F 1 "GND" H 3850 2780 30  0001 C CNN
	1    3850 2850
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 4D307E0E
P 4650 2050
F 0 "R1" V 4730 2050 50  0000 C CNN
F 1 "1k5" V 4650 2050 50  0000 C CNN
	1    4650 2050
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 4D307DDF
P 5250 2050
F 0 "R3" V 5330 2050 50  0000 C CNN
F 1 "68R" V 5250 2050 50  0000 C CNN
	1    5250 2050
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 4D307DDA
P 4650 2250
F 0 "R2" V 4730 2250 50  0000 C CNN
F 1 "68R" V 4650 2250 50  0000 C CNN
	1    4650 2250
	0    1    1    0   
$EndComp
$Comp
L ZENER D2
U 1 1 4D307BE4
P 4350 2550
F 0 "D2" H 4350 2650 50  0000 C CNN
F 1 "3.6V" H 4350 2450 40  0000 C CNN
	1    4350 2550
	0    -1   -1   0   
$EndComp
$Comp
L ZENER D1
U 1 1 4D3076CE
P 4050 2550
F 0 "D1" H 4050 2650 50  0000 C CNN
F 1 "3.6V" H 4050 2450 40  0000 C CNN
	1    4050 2550
	0    -1   -1   0   
$EndComp
$Comp
L SW_PUSH_MJD S1
U 1 1 4D30766C
P 5250 2450
F 0 "S1" H 5400 2560 50  0000 C CNN
F 1 "PAUSE" H 5250 2370 50  0000 C CNN
	1    5250 2450
	1    0    0    -1  
$EndComp
$Comp
L USB_2 JP1
U 1 1 4D3075CD
P 3500 2200
F 0 "JP1" H 3425 2450 60  0000 C CNN
F 1 "USB_2" H 3550 1900 60  0001 C CNN
F 2 "USB_PCB_FINGERS" H 3365 2510 60  0001 C CNN
F 4 "+5V" H 3825 2350 50  0001 C CNN "VCC"
F 5 "D-" H 3800 2250 50  0001 C CNN "Data-"
F 6 "D+" H 3800 2150 50  0001 C CNN "Data+"
F 7 "GND" H 3825 2050 50  0001 C CNN "Ground"
	1    3500 2200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
