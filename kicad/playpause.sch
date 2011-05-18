EESchema Schematic File Version 2  date Thu 19 May 2011 09:45:53 AM EST
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
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
Sheet 1 1
Title "Playpause"
Date "18 may 2011"
Rev "v1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Notes Line
	8650 2550 9250 2550
Wire Notes Line
	9250 2550 9250 3450
Wire Notes Line
	9250 3450 8450 3450
Wire Notes Line
	8800 1700 5750 1700
Wire Notes Line
	8800 1700 8800 3100
Wire Notes Line
	8400 3350 9100 3350
Wire Notes Line
	9100 3350 9100 1500
Wire Notes Line
	8400 3250 8950 3250
Wire Notes Line
	4900 2250 4900 2350
Wire Notes Line
	4900 2350 4750 2350
Wire Notes Line
	4750 2350 4750 3350
Wire Notes Line
	4750 3350 6200 3350
Wire Wire Line
	8250 3450 7700 3450
Wire Wire Line
	8250 3350 7700 3350
Wire Wire Line
	8250 3250 7700 3250
Wire Wire Line
	6350 3450 6900 3450
Wire Wire Line
	6350 3350 6900 3350
Wire Wire Line
	6350 3250 6900 3250
Wire Wire Line
	5900 2550 5950 2550
Wire Wire Line
	5900 2150 5950 2150
Wire Wire Line
	5550 2450 5950 2450
Connection ~ 4350 2750
Wire Wire Line
	8650 2550 8650 2750
Wire Wire Line
	8650 2750 3850 2750
Connection ~ 4950 2050
Wire Wire Line
	4900 2050 5050 2050
Wire Wire Line
	4950 2050 4950 2150
Wire Wire Line
	4400 2050 3700 2050
Wire Wire Line
	3700 2250 4400 2250
Wire Wire Line
	5950 2250 4900 2250
Connection ~ 4350 2150
Wire Wire Line
	4350 2350 4350 2150
Wire Wire Line
	5550 2050 5950 2050
Wire Wire Line
	4050 2350 4050 2250
Connection ~ 4050 2250
Connection ~ 4050 2750
Wire Wire Line
	3850 2850 3850 2350
Connection ~ 3850 2750
Wire Wire Line
	4950 2150 3700 2150
Wire Wire Line
	3850 2350 3700 2350
Connection ~ 3850 2050
Wire Wire Line
	3850 1800 8650 1800
Wire Wire Line
	8650 1800 8650 2050
Wire Wire Line
	4950 2450 4850 2450
Wire Wire Line
	4850 2450 4850 2750
Connection ~ 4850 2750
Wire Wire Line
	3850 2050 3850 1700
Connection ~ 3850 1800
Wire Notes Line
	6200 3450 4600 3450
Wire Notes Line
	4600 3450 4600 2850
Wire Notes Line
	4600 2850 5750 2850
Wire Notes Line
	5750 2850 5750 2550
Wire Notes Line
	6200 3250 6200 3100
Wire Notes Line
	6200 3100 8800 3100
Wire Notes Line
	5750 1700 5750 2150
Wire Notes Line
	5550 2050 5550 1500
Wire Notes Line
	5550 1500 9100 1500
Wire Notes Line
	8950 3250 8950 2050
Wire Notes Line
	8950 2050 8650 2050
Text Label 7900 3450 0    60   ~ 0
GND
Text Label 6550 3450 0    60   ~ 0
RST
Text Label 7900 3350 0    60   ~ 0
MOSI
Text Label 6550 3350 0    60   ~ 0
SCK
Text Label 7900 3250 0    60   ~ 0
VTG
Text Label 6550 3250 0    60   ~ 0
MISO
$Comp
L CONN_1 P9
U 1 1 4DCBBCBB
P 8400 3450
F 0 "P9" H 8450 3450 40  0000 L CNN
F 1 "CONN_1" H 8400 3505 30  0001 C CNN
	1    8400 3450
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P8
U 1 1 4DCBBCBA
P 8400 3350
F 0 "P8" H 8450 3350 40  0000 L CNN
F 1 "CONN_1" H 8400 3405 30  0001 C CNN
	1    8400 3350
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P7
U 1 1 4DCBBCB9
P 8400 3250
F 0 "P7" H 8450 3250 40  0000 L CNN
F 1 "CONN_1" H 8400 3305 30  0001 C CNN
	1    8400 3250
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P6
U 1 1 4DCBBCAB
P 6200 3450
F 0 "P6" H 6250 3450 40  0000 L CNN
F 1 "CONN_1" H 6200 3505 30  0001 C CNN
	1    6200 3450
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P5
U 1 1 4DCBBCA6
P 6200 3350
F 0 "P5" H 6250 3350 40  0000 L CNN
F 1 "CONN_1" H 6200 3405 30  0001 C CNN
	1    6200 3350
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P4
U 1 1 4DCBBCA1
P 6200 3250
F 0 "P4" H 6250 3250 40  0000 L CNN
F 1 "CONN_1" H 6200 3305 30  0001 C CNN
	1    6200 3250
	-1   0    0    1   
$EndComp
$Comp
L CONN_3X2 P3
U 1 1 4DCBBC64
P 7300 3400
F 0 "P3" H 7300 3650 50  0000 C CNN
F 1 "ISP" V 7300 3450 40  0000 C CNN
	1    7300 3400
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P2
U 1 1 4DCA84FD
P 5750 2550
F 0 "P2" H 5800 2550 40  0000 L CNN
F 1 "CONN_1" H 5750 2605 30  0001 C CNN
	1    5750 2550
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P1
U 1 1 4DCA84C8
P 5750 2150
F 0 "P1" H 5800 2150 40  0000 L CNN
F 1 "CONN_1" H 5750 2205 30  0001 C CNN
	1    5750 2150
	-1   0    0    1   
$EndComp
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
P 6150 1950
F 0 "IC1" H 6250 2000 60  0000 C CNN
F 1 "ATTINY85" H 8150 1200 60  0000 C CNN
F 2 "SO8-200" H 6400 1200 60  0001 C CNN
	1    6150 1950
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
P 5300 2050
F 0 "R3" V 5380 2050 50  0000 C CNN
F 1 "68R" V 5300 2050 50  0000 C CNN
	1    5300 2050
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
