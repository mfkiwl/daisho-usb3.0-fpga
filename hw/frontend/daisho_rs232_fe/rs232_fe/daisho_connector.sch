EESchema Schematic File Version 2
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
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:samtec_qsh_090-d
LIBS:hole
LIBS:TRS3237E
LIBS:TRSF3243
LIBS:MUN5212DW1
LIBS:MIC5318
LIBS:rs232_fe-cache
EELAYER 24 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title "Daisho Project RS232 Front-End Board"
Date "27 sep 2014"
Rev "1.0 Rev1"
Comp ""
Comment1 "Copyright © 2013/2014 Benjamin Vernoux"
Comment2 "License: GNU General Public License, version 2"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SAMTEC_QSH-090-D J1
U 1 1 51D6425B
P 3050 2600
F 0 "J1" H 3050 2650 60  0000 C CNN
F 1 "SAMTEC_QSH-090-D" H 3100 2550 60  0000 C CNN
F 2 "samtec_qsh-090-01-f-d-a:SAMTEC_QSH-090-01-F-D-A" H 3050 2600 60  0001 C CNN
F 3 "https://www.samtec.com/technical-specifications/Default.aspx?SeriesMaster=QSH" H 3050 2600 60  0001 C CNN
F 4 "Samtec" H 3050 2600 60  0001 C CNN "Manufacturer"
F 5 "QSH-090-01-F-D-A" H 3050 2600 60  0001 C CNN "Part Number"
F 6 "CONN RECPT 180POS 0.5MM SMT" H 3050 2600 60  0001 C CNN "Description"
F 7 "http://www.digikey.com/product-detail/en/QSH-090-01-F-D-A/QSH-090-01-F-D-A-ND/2664439" H 3050 2600 60  0001 C CNN "DigiKey"
F 8 "http://components.arrow.com/part/detail/29558048S6264918N1004" H 3050 2600 60  0001 C CNN "Arrow"
	1    3050 2600
	1    0    0    -1  
$EndComp
$Comp
L SAMTEC_QSH-090-D J1
U 2 1 51D64261
P 6250 2600
F 0 "J1" H 6250 2650 60  0000 C CNN
F 1 "SAMTEC_QSH-090-D" H 6300 2550 60  0000 C CNN
F 2 "samtec_qsh-090-01-f-d-a:SAMTEC_QSH-090-01-F-D-A" H 6250 2600 60  0001 C CNN
F 3 "" H 6250 2600 60  0001 C CNN
	2    6250 2600
	1    0    0    -1  
$EndComp
$Comp
L SAMTEC_QSH-090-D J1
U 3 1 51D64267
P 9350 2600
F 0 "J1" H 9350 2650 60  0000 C CNN
F 1 "SAMTEC_QSH-090-D" H 9400 2550 60  0000 C CNN
F 2 "samtec_qsh-090-01-f-d-a:SAMTEC_QSH-090-01-F-D-A" H 9350 2600 60  0001 C CNN
F 3 "" H 9350 2600 60  0001 C CNN
	3    9350 2600
	1    0    0    -1  
$EndComp
$Comp
L 24C16 U1
U 1 1 51DE64DC
P 1750 1550
F 0 "U1" H 1900 1900 60  0000 C CNN
F 1 "24C08" H 1950 1200 60  0000 C CNN
F 2 "SO8E" H 1750 1550 60  0000 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/CAT24C08-D.PDF" H 1750 1550 60  0001 C CNN
F 4 "On Semiconductor" H 1750 1550 60  0001 C CNN "Manufacturer"
F 5 "CAT24C08WI-GT3" H 1750 1550 60  0001 C CNN "Part Number"
F 6 "IC EEPROM 8KBIT 400KHZ 8SOIC" H 1750 1550 60  0001 C CNN "Description"
F 7 "http://www.digikey.com/product-detail/en/CAT24C08WI-GT3/CAT24C08WI-GT3CT-ND" H 1750 1550 60  0001 C CNN "Field7"
	1    1750 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 51DE6697
P 2900 6450
F 0 "#PWR01" H 2900 6450 30  0001 C CNN
F 1 "GND" H 2900 6380 30  0001 C CNN
F 2 "" H 2900 6450 60  0001 C CNN
F 3 "" H 2900 6450 60  0001 C CNN
	1    2900 6450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 51DE6A1A
P 950 1700
F 0 "#PWR02" H 950 1700 30  0001 C CNN
F 1 "GND" H 950 1630 30  0001 C CNN
F 2 "" H 950 1700 60  0001 C CNN
F 3 "" H 950 1700 60  0001 C CNN
	1    950  1700
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 51DDE1CA
P 4250 1250
F 0 "R1" V 4330 1250 50  0000 C CNN
F 1 "10k" V 4250 1250 50  0000 C CNN
F 2 "gsg-sm0603:GSG-0603" H 4250 1250 60  0001 C CNN
F 3 "" H 4250 1250 60  0001 C CNN
F 4 "Stackpole" H 4250 1250 60  0001 C CNN "Manufacturer"
F 5 "RMCF0603JT10K0" H 4250 1250 60  0001 C CNN "Part Number"
F 6 "RES 10K OHM 1/10W 5% 0603 SMD" H 4250 1250 60  0001 C CNN "Description"
F 7 "~" V 4350 1050 60  0000 C CNN "Note"
	1    4250 1250
	0    1    -1   0   
$EndComp
$Comp
L GND #PWR03
U 1 1 51DDE55A
P 6100 6450
F 0 "#PWR03" H 6100 6450 30  0001 C CNN
F 1 "GND" H 6100 6380 30  0001 C CNN
F 2 "" H 6100 6450 60  0001 C CNN
F 3 "" H 6100 6450 60  0001 C CNN
	1    6100 6450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 51DDE568
P 9200 6450
F 0 "#PWR04" H 9200 6450 30  0001 C CNN
F 1 "GND" H 9200 6380 30  0001 C CNN
F 2 "" H 9200 6450 60  0001 C CNN
F 3 "" H 9200 6450 60  0001 C CNN
	1    9200 6450
	1    0    0    -1  
$EndComp
Text Label 2600 1650 0    60   ~ 0
FE_I2C_SCL
Text Label 2600 1750 0    60   ~ 0
FE_I2C_SDA
Text Label 2250 2900 2    60   ~ 0
FE_I2C_SDA
Text Label 2250 3000 2    60   ~ 0
FE_I2C_SCL
$Comp
L GND #PWR05
U 1 1 51DDF418
P 1750 2150
F 0 "#PWR05" H 1750 2150 30  0001 C CNN
F 1 "GND" H 1750 2080 30  0001 C CNN
F 2 "" H 1750 2150 60  0001 C CNN
F 3 "" H 1750 2150 60  0001 C CNN
	1    1750 2150
	1    0    0    -1  
$EndComp
Text GLabel 1800 4100 0    39   Input ~ 0
CD-A-TTL
Text GLabel 1800 4900 0    39   Input ~ 0
DSR-A-TTL
Text GLabel 1800 4800 0    39   Input ~ 0
RXD-A-TTL
Text GLabel 1800 4700 0    39   Input ~ 0
CTS-A-TTL
Text GLabel 1800 4500 0    39   Input ~ 0
RI-A-TTL
Text GLabel 1850 3600 0    39   Input ~ 0
!INVALID-A-TTL
Text GLabel 1850 3800 0    39   Input ~ 0
FORCEON-A-TTL
Text GLabel 1850 3700 0    39   Input ~ 0
!FORCEOFF-A-TTL
Text GLabel 1800 4400 0    39   Input ~ 0
RTS-A-TTL
Text GLabel 1800 4300 0    39   Input ~ 0
TXD-A-TTL
Text GLabel 1800 4200 0    39   Input ~ 0
DTR-A-TTL
Text GLabel 4300 4100 2    39   Input ~ 0
CD-B-TTL
Text GLabel 4300 4900 2    39   Input ~ 0
DSR-B-TTL
Text GLabel 4300 4800 2    39   Input ~ 0
RXD-B-TTL
Text GLabel 4300 4700 2    39   Input ~ 0
CTS-B-TTL
Text GLabel 4300 4500 2    39   Input ~ 0
RI-B-TTL
Text GLabel 4300 4400 2    39   Input ~ 0
RTS-B-TTL
Text GLabel 4300 4300 2    39   Input ~ 0
TXD-B-TTL
Text GLabel 4300 4200 2    39   Input ~ 0
DTR-B-TTL
Text GLabel 4250 3700 2    39   Input ~ 0
MBAUD-B-TTL
Text GLabel 4250 3600 2    39   Input ~ 0
!EN-B-TTL
Text GLabel 4250 3500 2    39   Input ~ 0
!SHDN-B-TTL
Text Label 3950 2900 0    60   ~ 0
VALT_FE
Text Label 3900 3100 0    60   ~ 0
FE_CLKSRC
Text Label 3900 3200 0    60   ~ 0
FE_CLK_P1
Text Label 3900 3300 0    60   ~ 0
FE_CLK_N1
Text Label 3900 3400 0    60   ~ 0
VRAW_SW_5V
Text Label 3900 3500 0    60   ~ 0
FE_A1
Text Label 3900 3600 0    60   ~ 0
FE_A3
Text Label 3900 3700 0    60   ~ 0
FE_A5
Text Label 2200 3800 2    60   ~ 0
FE_A6
Text Label 2200 3700 2    60   ~ 0
FE_A4
Text Label 2200 3600 2    60   ~ 0
FE_A2
Text Label 2200 3500 2    60   ~ 0
FE_A0
Text Label 2200 4500 2    60   ~ 0
FE_A18
Text Label 2200 4400 2    60   ~ 0
FE_A16
Text Label 2200 4300 2    60   ~ 0
FE_A14
Text Label 2200 4200 2    60   ~ 0
FE_A12
Text Label 2200 4100 2    60   ~ 0
FE_A10
Text Label 3900 4100 0    60   ~ 0
FE_A11
Text Label 3900 4200 0    60   ~ 0
FE_A13
Text Label 3900 4300 0    60   ~ 0
FE_A15
Text Label 3900 4400 0    60   ~ 0
FE_A17
Text Label 3900 4500 0    60   ~ 0
FE_A19
Text Label 3900 4700 0    60   ~ 0
FE_A21
Text Label 3900 4800 0    60   ~ 0
FE_A23
Text Label 3900 4900 0    60   ~ 0
FE_A25
Text Label 2200 4900 2    60   ~ 0
FE_A24
Text Label 2200 4800 2    60   ~ 0
FE_A22
Text Label 2200 4700 2    60   ~ 0
FE_A20
Text Label 2200 3300 2    60   ~ 0
FE_CLK_N0
Text Label 2200 3200 2    60   ~ 0
FE_CLK_P0
Text Notes 800  800  0    60   ~ 0
Identification EEPROM:\nRead by main board MCU, \nto identify type of Front End ...
Text GLabel 4700 950  0    60   Input ~ 0
FE_I2C_VCC
NoConn ~ 3650 3100
NoConn ~ 3650 3200
NoConn ~ 3650 3300
NoConn ~ 2450 3300
NoConn ~ 2450 3200
Text GLabel 1550 2950 0    60   Output ~ 0
FE_I2C_VCC
Text GLabel 1850 950  2    60   Input ~ 0
FE_I2C_VCC
Text GLabel 1550 3250 0    60   Input ~ 0
3V3A
Text Label 1550 3400 2    60   ~ 0
FE_VCCIO_A
Text Label 1550 3100 2    60   ~ 0
V3P3D
Text Notes 4100 800  0    60   ~ 0
I2C EEPROM Write Protect\nEnabled by default
$Comp
L CONN_2 P1
U 1 1 51E2E274
P 4600 1550
F 0 "P1" V 4550 1550 40  0000 C CNN
F 1 "CONN_2" V 4650 1550 40  0000 C CNN
F 2 "gsg-header-1x2:GSG-HEADER-1x2" H 4600 1550 60  0001 C CNN
F 3 "" H 4600 1550 60  0001 C CNN
F 4 "DNP" H 4600 1300 60  0000 C CNN "Note"
	1    4600 1550
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 51E2ED78
P 3600 1450
F 0 "R2" V 3680 1450 50  0000 C CNN
F 1 "10k" V 3600 1450 50  0000 C CNN
F 2 "gsg-sm0603:GSG-0603" H 3600 1450 60  0001 C CNN
F 3 "" H 3600 1450 60  0001 C CNN
F 4 "Stackpole" H 3600 1450 60  0001 C CNN "Manufacturer"
F 5 "RMCF0603JT10K0" H 3600 1450 60  0001 C CNN "Part Number"
F 6 "RES 10K OHM 1/10W 5% 0603 SMD" H 3600 1450 60  0001 C CNN "Description"
F 7 "~" V 3700 1250 60  0000 C CNN "Note"
	1    3600 1450
	0    -1   1    0   
$EndComp
Text Notes 4750 1500 0    60   ~ 0
No Jumper by default\n(Write Protect mode)
Wire Wire Line
	2450 2900 2250 2900
Wire Wire Line
	2450 3000 2250 3000
Wire Wire Line
	2900 6200 2900 6450
Wire Wire Line
	3000 6200 3000 6350
Wire Wire Line
	2900 6350 3200 6350
Connection ~ 2900 6350
Wire Wire Line
	3100 6350 3100 6200
Connection ~ 3000 6350
Wire Wire Line
	3200 6350 3200 6200
Connection ~ 3100 6350
Wire Wire Line
	1050 1350 950  1350
Wire Wire Line
	950  1350 950  1700
Wire Wire Line
	1050 1450 950  1450
Connection ~ 950  1450
Wire Wire Line
	650  1550 1050 1550
Connection ~ 950  1550
Wire Wire Line
	6100 6200 6100 6450
Wire Wire Line
	6200 6200 6200 6350
Wire Wire Line
	6100 6350 6400 6350
Connection ~ 6100 6350
Wire Wire Line
	6300 6350 6300 6200
Connection ~ 6200 6350
Wire Wire Line
	6400 6350 6400 6200
Connection ~ 6300 6350
Wire Wire Line
	9200 6200 9200 6450
Wire Wire Line
	9300 6200 9300 6350
Wire Wire Line
	9200 6350 9500 6350
Connection ~ 9200 6350
Wire Wire Line
	9400 6350 9400 6200
Connection ~ 9300 6350
Wire Wire Line
	9500 6350 9500 6200
Connection ~ 9400 6350
Wire Wire Line
	2450 1650 2600 1650
Wire Wire Line
	2450 1750 2600 1750
Wire Wire Line
	1550 3100 2450 3100
Wire Wire Line
	3650 2900 3950 2900
Wire Wire Line
	3650 3400 3900 3400
Wire Wire Line
	3650 3500 4250 3500
Wire Wire Line
	3650 3600 4250 3600
Wire Wire Line
	3650 3700 4250 3700
Wire Wire Line
	3650 4100 4300 4100
Wire Wire Line
	3650 4200 4300 4200
Wire Wire Line
	3650 4300 4300 4300
Wire Wire Line
	3650 4400 4300 4400
Wire Wire Line
	3650 4500 4300 4500
Wire Wire Line
	3650 4700 4300 4700
Wire Wire Line
	3650 4800 4300 4800
Wire Wire Line
	3650 4900 4300 4900
Wire Wire Line
	1550 3400 2450 3400
Wire Wire Line
	1850 3500 2450 3500
Wire Wire Line
	1850 3600 2450 3600
Wire Wire Line
	1850 3700 2450 3700
Wire Wire Line
	1800 4100 2450 4100
Wire Wire Line
	1800 4200 2450 4200
Wire Wire Line
	1800 4300 2450 4300
Wire Wire Line
	1800 4400 2450 4400
Wire Wire Line
	1800 4500 2450 4500
Wire Wire Line
	1800 4700 2450 4700
Wire Wire Line
	1800 4800 2450 4800
Wire Wire Line
	1800 4900 2450 4900
Wire Wire Line
	3650 3000 3750 3000
Wire Wire Line
	3750 3000 3750 2900
Connection ~ 3750 2900
Wire Wire Line
	3750 3400 3750 5200
Connection ~ 3750 4000
Connection ~ 3750 3400
Wire Wire Line
	3750 4000 3650 4000
Connection ~ 3750 4600
Wire Wire Line
	3750 4600 3650 4600
Wire Wire Line
	3750 5200 3650 5200
Wire Wire Line
	2450 4000 2350 4000
Wire Wire Line
	2350 3400 2350 5200
Connection ~ 2350 3400
Wire Wire Line
	2350 4600 2450 4600
Connection ~ 2350 4000
Wire Wire Line
	2350 5200 2450 5200
Connection ~ 2350 4600
Wire Wire Line
	1550 2950 1650 2950
Wire Wire Line
	1650 2950 1650 3100
Connection ~ 1650 3100
Wire Wire Line
	1550 3250 1650 3250
Wire Wire Line
	1650 3150 1650 3400
Connection ~ 1650 3400
Wire Wire Line
	2450 3800 1850 3800
Wire Wire Line
	4500 1250 4800 1250
Wire Wire Line
	4800 1250 4800 950 
Wire Wire Line
	4800 950  4700 950 
Wire Wire Line
	4000 1250 3950 1250
Wire Wire Line
	3950 1250 3950 1450
Connection ~ 3950 1450
$Comp
L GND #PWR06
U 1 1 51E2F31D
P 4200 1850
F 0 "#PWR06" H 4200 1850 30  0001 C CNN
F 1 "GND" H 4200 1780 30  0001 C CNN
F 2 "" H 4200 1850 60  0001 C CNN
F 3 "" H 4200 1850 60  0001 C CNN
	1    4200 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1650 4200 1650
Wire Wire Line
	4200 1650 4200 1850
Text GLabel 3000 950  2    60   Input ~ 0
FE_I2C_EEPROM_WP
Wire Wire Line
	2450 1450 3350 1450
Wire Wire Line
	3000 950  2850 950 
Wire Wire Line
	2850 950  2850 1450
Connection ~ 2850 1450
Wire Wire Line
	3850 1450 4250 1450
Text GLabel 1850 3500 0    60   Input ~ 0
FE_I2C_EEPROM_WP
NoConn ~ 5650 2900
NoConn ~ 5650 3000
NoConn ~ 5650 3100
NoConn ~ 5650 3200
NoConn ~ 5650 3300
NoConn ~ 5650 3500
NoConn ~ 5650 3600
NoConn ~ 5650 3700
NoConn ~ 5650 3800
NoConn ~ 5650 3900
NoConn ~ 5650 4100
NoConn ~ 5650 4200
NoConn ~ 5650 4300
NoConn ~ 5650 4400
NoConn ~ 5650 4500
NoConn ~ 5650 4700
NoConn ~ 5650 4800
NoConn ~ 5650 4900
NoConn ~ 5650 5000
NoConn ~ 5650 5100
NoConn ~ 5650 5300
NoConn ~ 5650 5400
NoConn ~ 5650 5500
NoConn ~ 5650 5600
NoConn ~ 5650 5700
NoConn ~ 5650 5800
NoConn ~ 6850 2900
NoConn ~ 6850 3000
NoConn ~ 6850 3100
NoConn ~ 6850 3200
NoConn ~ 6850 3300
NoConn ~ 6850 3500
NoConn ~ 6850 3600
NoConn ~ 6850 3700
NoConn ~ 6850 3800
NoConn ~ 6850 3900
NoConn ~ 6850 4100
NoConn ~ 6850 4200
NoConn ~ 6850 4300
NoConn ~ 6850 4400
NoConn ~ 6850 4500
NoConn ~ 6850 4900
NoConn ~ 6850 4800
NoConn ~ 6850 4700
NoConn ~ 6850 5000
NoConn ~ 6850 5100
NoConn ~ 6850 5300
NoConn ~ 6850 5400
NoConn ~ 6850 5500
NoConn ~ 6850 5600
NoConn ~ 6850 5700
NoConn ~ 6850 5800
Text GLabel 10550 3800 2    39   Input ~ 0
MBAUD-D-TTL
Text GLabel 10550 3700 2    39   Input ~ 0
!EN-D-TTL
Text GLabel 10550 3600 2    39   Input ~ 0
!SHDN-D-TTL
Text Label 10200 3600 0    60   ~ 0
FE_C13
Text Label 10200 3700 0    60   ~ 0
FE_C15
Text Label 10200 3800 0    60   ~ 0
FE_C17
Text Label 10200 4300 0    60   ~ 0
FE_C25
Text Label 10200 4400 0    60   ~ 0
FE_C27
Text Label 10200 4500 0    60   ~ 0
FE_C29
Text Label 10200 4700 0    60   ~ 0
FE_C31
Text Label 10200 4800 0    60   ~ 0
FE_C33
Text Label 10200 4900 0    60   ~ 0
FE_C35
Wire Wire Line
	9950 3600 10550 3600
Wire Wire Line
	9950 3700 10550 3700
Wire Wire Line
	9950 3800 10550 3800
Wire Wire Line
	9950 4300 10600 4300
Wire Wire Line
	9950 4400 10600 4400
Wire Wire Line
	9950 4500 10600 4500
Wire Wire Line
	9950 4700 10600 4700
Wire Wire Line
	9950 4800 10600 4800
Wire Wire Line
	9950 4900 10600 4900
Text GLabel 8150 3600 0    39   Input ~ 0
!INVALID-C-TTL
Text GLabel 8150 3800 0    39   Input ~ 0
FORCEON-C-TTL
Text GLabel 8150 3700 0    39   Input ~ 0
!FORCEOFF-C-TTL
Text Label 8500 3800 2    60   ~ 0
FE_C16
Text Label 8500 3700 2    60   ~ 0
FE_C14
Text Label 8500 3600 2    60   ~ 0
FE_C12
Text Label 8500 4400 2    60   ~ 0
FE_C26
Text Label 8500 4300 2    60   ~ 0
FE_C24
Text Label 8500 4200 2    60   ~ 0
FE_C22
Text Label 8500 4100 2    60   ~ 0
FE_C20
Text Label 8500 4900 2    60   ~ 0
FE_C34
Text Label 8500 4800 2    60   ~ 0
FE_C32
Text Label 8500 4700 2    60   ~ 0
FE_C30
Wire Wire Line
	8150 3600 8750 3600
Wire Wire Line
	8150 3700 8750 3700
NoConn ~ 9950 2900
NoConn ~ 9950 3000
NoConn ~ 9950 3100
NoConn ~ 9950 3200
NoConn ~ 9950 3300
NoConn ~ 8750 3000
NoConn ~ 8750 3100
NoConn ~ 8750 3200
NoConn ~ 8750 3300
NoConn ~ 8750 3500
NoConn ~ 9950 5500
NoConn ~ 9950 5600
NoConn ~ 9950 5700
NoConn ~ 9950 5800
NoConn ~ 9950 5400
NoConn ~ 8750 5800
NoConn ~ 8750 5700
NoConn ~ 8750 5600
NoConn ~ 8750 5500
NoConn ~ 8750 5400
NoConn ~ 8750 5300
NoConn ~ 8750 5100
NoConn ~ 8750 5000
NoConn ~ 3650 3800
NoConn ~ 3650 3900
NoConn ~ 2450 5000
NoConn ~ 2450 5100
NoConn ~ 2450 5300
NoConn ~ 2450 5400
NoConn ~ 2450 5500
NoConn ~ 2450 5600
NoConn ~ 2450 5700
NoConn ~ 2450 5800
NoConn ~ 3650 5000
NoConn ~ 3650 5100
NoConn ~ 3650 5300
NoConn ~ 3650 5400
NoConn ~ 3650 5500
NoConn ~ 3650 5600
NoConn ~ 3650 5700
NoConn ~ 3650 5800
NoConn ~ 9950 5100
NoConn ~ 8750 3900
Wire Wire Line
	8150 3800 8750 3800
Text GLabel 8300 3250 0    60   Input ~ 0
3V3C
Text Label 8300 3400 2    60   ~ 0
FE_VCCIO_C
Wire Wire Line
	8300 3250 8400 3250
Wire Wire Line
	8400 3100 8400 3400
Connection ~ 8400 3400
Wire Wire Line
	8650 5200 8750 5200
Wire Wire Line
	8650 3400 8650 5200
Wire Wire Line
	8650 4600 8750 4600
Wire Wire Line
	8750 4000 8650 4000
Connection ~ 8650 4600
Connection ~ 8650 3400
Connection ~ 8650 4000
Text GLabel 10550 3900 2    39   Input ~ 0
CD-D-TTL
Text GLabel 10600 4500 2    39   Input ~ 0
RI-D-TTL
Text GLabel 10600 4400 2    39   Input ~ 0
RTS-D-TTL
Text GLabel 10600 4300 2    39   Input ~ 0
TXD-D-TTL
Text GLabel 8550 2900 0    39   Input ~ 0
DTR-D-TTL
Text GLabel 10600 4900 2    39   Input ~ 0
DSR-D-TTL
Text GLabel 10600 4800 2    39   Input ~ 0
RXD-D-TTL
Text GLabel 10600 4700 2    39   Input ~ 0
CTS-D-TTL
Text GLabel 8100 4100 0    39   Input ~ 0
CD-C-TTL
Text GLabel 8100 4900 0    39   Input ~ 0
DSR-C-TTL
Text GLabel 8100 4800 0    39   Input ~ 0
RXD-C-TTL
Text GLabel 8100 4700 0    39   Input ~ 0
CTS-C-TTL
Text GLabel 8100 4500 0    39   Input ~ 0
RI-C-TTL
Text GLabel 8100 4400 0    39   Input ~ 0
RTS-C-TTL
Text GLabel 8100 4300 0    39   Input ~ 0
TXD-C-TTL
Text GLabel 8100 4200 0    39   Input ~ 0
DTR-C-TTL
Wire Wire Line
	8100 4100 8750 4100
Wire Wire Line
	8100 4200 8750 4200
Wire Wire Line
	8100 4300 8750 4300
Wire Wire Line
	8100 4400 8750 4400
Wire Wire Line
	8100 4500 8750 4500
Wire Wire Line
	8100 4700 8750 4700
Wire Wire Line
	8100 4800 8750 4800
Wire Wire Line
	8100 4900 8750 4900
Text Label 10100 3400 0    60   ~ 0
FE_VCCIO_C
Wire Wire Line
	9950 3400 10950 3400
Wire Wire Line
	10050 5200 9950 5200
Wire Wire Line
	10050 3400 10050 5200
Wire Wire Line
	10050 4000 9950 4000
Connection ~ 10050 3400
Connection ~ 10050 4000
NoConn ~ 9950 5300
Text GLabel 10700 3250 2    60   Input ~ 0
3V3C
Wire Wire Line
	10700 3250 10650 3250
Wire Wire Line
	10650 3100 10650 3400
Connection ~ 10650 3400
NoConn ~ 9950 3500
Text Label 8500 4500 2    60   ~ 0
FE_C28
Wire Wire Line
	9950 4600 10050 4600
Connection ~ 10050 4600
NoConn ~ 9950 5000
Text GLabel 5350 3250 0    60   Input ~ 0
3V3B
Text Label 5350 3400 2    60   ~ 0
FE_VCCIO_B
Wire Wire Line
	5350 3250 5450 3250
Wire Wire Line
	5450 3100 5450 3400
Connection ~ 5450 3400
Wire Wire Line
	5350 3400 5650 3400
Wire Wire Line
	5550 5200 5650 5200
Wire Wire Line
	5550 3400 5550 5200
Wire Wire Line
	5550 4600 5650 4600
Wire Wire Line
	5550 4000 5650 4000
Connection ~ 5550 4600
Connection ~ 5550 3400
Connection ~ 5550 4000
Text GLabel 7150 3250 2    60   Input ~ 0
3V3B
Text Label 7150 3400 0    60   ~ 0
FE_VCCIO_B
Wire Wire Line
	7150 3250 7050 3250
Wire Wire Line
	7050 3400 7050 3100
Connection ~ 7050 3400
Wire Wire Line
	6850 3400 7150 3400
Wire Wire Line
	8300 3400 8750 3400
Wire Wire Line
	6850 4000 6950 4000
Wire Wire Line
	6950 3400 6950 5200
Connection ~ 6950 3400
Wire Wire Line
	6950 4600 6850 4600
Connection ~ 6950 4000
Wire Wire Line
	6950 5200 6850 5200
Connection ~ 6950 4600
$Comp
L CONN_2 P8
U 1 1 51E459D6
P 4600 7350
F 0 "P8" V 4550 7350 40  0000 C CNN
F 1 "CONN_2" V 4650 7350 40  0000 C CNN
F 2 "gsg-header-1x2:GSG-HEADER-1x2" H 4600 7350 60  0001 C CNN
F 3 "" H 4600 7350 60  0001 C CNN
F 4 "DNP" V 4800 7350 60  0000 C CNN "Note"
	1    4600 7350
	0    1    1    0   
$EndComp
Text GLabel 4350 6900 0    60   Input ~ 0
REG_3V3_LED
$Comp
L GND #PWR07
U 1 1 51E459DD
P 4950 6950
F 0 "#PWR07" H 4950 6950 30  0001 C CNN
F 1 "GND" H 4950 6880 30  0001 C CNN
F 2 "" H 4950 6950 60  0001 C CNN
F 3 "" H 4950 6950 60  0001 C CNN
	1    4950 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 6900 4500 6900
Wire Wire Line
	4500 6900 4500 7000
Wire Wire Line
	4700 7000 4700 6900
Wire Wire Line
	4700 6900 4950 6900
Wire Wire Line
	4950 6900 4950 6950
$Comp
L MIC5318 U7
U 1 1 52E5030D
P 9600 1250
F 0 "U7" H 9750 900 60  0000 C CNN
F 1 "MIC5318" H 9600 1600 60  0000 C CNN
F 2 "SOT23-5" H 9600 1250 60  0000 C CNN
F 3 "~" H 9600 1250 60  0000 C CNN
F 4 "Micrel" H 9600 1250 60  0001 C CNN "Manufacturer"
F 5 "MIC5318-3.3YD5 TR" H 9600 1250 60  0001 C CNN "Part Number"
F 6 "IC REG LDO 3.3V 0.3A TSOT23-5" H 9600 1250 60  0001 C CNN "Description"
	1    9600 1250
	1    0    0    -1  
$EndComp
$Comp
L MIC5318 U6
U 1 1 52E5031C
P 7000 1250
F 0 "U6" H 7150 900 60  0000 C CNN
F 1 "MIC5318" H 7000 1600 60  0000 C CNN
F 2 "SOT23-5" H 7000 1250 60  0000 C CNN
F 3 "~" H 7000 1250 60  0000 C CNN
F 4 "Micrel" H 7000 1250 60  0001 C CNN "Manufacturer"
F 5 "MIC5318-3.3YD5 TR" H 7000 1250 60  0001 C CNN "Part Number"
F 6 "IC REG LDO 3.3V 0.3A TSOT23-5" H 7000 1250 60  0001 C CNN "Description"
	1    7000 1250
	1    0    0    -1  
$EndComp
Text Notes 6450 750  0    60   ~ 0
REG_3V3 Power for Transceivers
Text Notes 9150 750  0    60   ~ 0
REG_3V3_LED Power for LEDs
Text GLabel 7850 1050 2    60   Output ~ 0
REG_3V3
Text Label 5900 1050 2    60   ~ 0
VRAW_SW_5V
Wire Wire Line
	5900 1050 6400 1050
Wire Wire Line
	7600 1050 7850 1050
Text Label 8750 1050 2    60   ~ 0
VRAW_SW_5V
Wire Wire Line
	8750 1050 9000 1050
Text GLabel 10550 1050 2    60   Output ~ 0
REG_3V3_LED
Wire Wire Line
	10200 1050 10550 1050
$Comp
L CONN_2 P7
U 1 1 52E526A4
P 3000 7350
F 0 "P7" V 2950 7350 40  0000 C CNN
F 1 "CONN_2" V 3050 7350 40  0000 C CNN
F 2 "gsg-header-1x2:GSG-HEADER-1x2" H 3000 7350 60  0001 C CNN
F 3 "" H 3000 7350 60  0001 C CNN
F 4 "DNP" V 3200 7350 60  0000 C CNN "Note"
	1    3000 7350
	0    1    1    0   
$EndComp
Text GLabel 2750 6900 0    60   Input ~ 0
REG_3V3
$Comp
L GND #PWR08
U 1 1 52E526AB
P 3350 6950
F 0 "#PWR08" H 3350 6950 30  0001 C CNN
F 1 "GND" H 3350 6880 30  0001 C CNN
F 2 "" H 3350 6950 60  0001 C CNN
F 3 "" H 3350 6950 60  0001 C CNN
	1    3350 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 6900 2900 6900
Wire Wire Line
	2900 6900 2900 7000
Wire Wire Line
	3100 7000 3100 6900
Wire Wire Line
	3100 6900 3350 6900
Wire Wire Line
	3350 6900 3350 6950
Text GLabel 1150 3150 0    60   Output ~ 0
REG_3V3
Connection ~ 1650 3250
Text GLabel 8300 3100 0    60   Output ~ 0
REG_3V3
Wire Wire Line
	8300 3100 8400 3100
Connection ~ 8400 3250
$Comp
L GND #PWR09
U 1 1 52E53596
P 7000 1950
F 0 "#PWR09" H 7000 1950 30  0001 C CNN
F 1 "GND" H 7000 1880 30  0001 C CNN
F 2 "" H 7000 1950 60  0001 C CNN
F 3 "" H 7000 1950 60  0001 C CNN
	1    7000 1950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 52E5359C
P 9600 1900
F 0 "#PWR010" H 9600 1900 30  0001 C CNN
F 1 "GND" H 9600 1830 30  0001 C CNN
F 2 "" H 9600 1900 60  0001 C CNN
F 3 "" H 9600 1900 60  0001 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1750 7000 1950
Wire Wire Line
	9600 1750 9600 1900
$Comp
L C C22
U 1 1 52E5394E
P 7650 1700
F 0 "C22" H 7700 1800 50  0000 L CNN
F 1 "0.1uF" H 7700 1600 50  0000 L CNN
F 2 "gsg-sm0603:GSG-0603" H 7650 1700 60  0001 C CNN
F 3 "" H 7650 1700 60  0001 C CNN
F 4 "Johanson Dialectrics" H -6750 1050 60  0001 C CNN "Manufacturer"
F 5 "160R14W104KV4T" H -6750 1050 60  0001 C CNN "Part Number"
F 6 "CAP CER 0.1UF 16V 10% X7R 0603" H -6750 1050 60  0001 C CNN "Description"
F 7 "http://www.digikey.com/product-detail/en/160R14W104KV4T/709-1153-1-ND/1859485" H -6750 1050 60  0001 C CNN "Field7"
	1    7650 1700
	1    0    0    -1  
$EndComp
$Comp
L C C25
U 1 1 52E53996
P 10300 1700
F 0 "C25" H 10350 1800 50  0000 L CNN
F 1 "0.1uF" H 10350 1600 50  0000 L CNN
F 2 "gsg-sm0603:GSG-0603" H 10300 1700 60  0001 C CNN
F 3 "" H 10300 1700 60  0001 C CNN
F 4 "Johanson Dialectrics" H -6750 1050 60  0001 C CNN "Manufacturer"
F 5 "160R14W104KV4T" H -6750 1050 60  0001 C CNN "Part Number"
F 6 "CAP CER 0.1UF 16V 10% X7R 0603" H -6750 1050 60  0001 C CNN "Description"
F 7 "http://www.digikey.com/product-detail/en/160R14W104KV4T/709-1153-1-ND/1859485" H -6750 1050 60  0001 C CNN "Field7"
	1    10300 1700
	1    0    0    -1  
$EndComp
$Comp
L C C21
U 1 1 52E54126
P 6000 1300
F 0 "C21" H 6050 1400 50  0000 L CNN
F 1 "1uF" H 6050 1200 50  0000 L CNN
F 2 "gsg-sm0603:GSG-0603" H 6000 1300 60  0001 C CNN
F 3 "" H 6000 1300 60  0001 C CNN
F 4 "Samsung" H 6000 1300 60  0001 C CNN "Manufacturer"
F 5 "CL10A105KB8NNNC" H 6000 1300 60  0001 C CNN "Part Number"
F 6 "CAP CER 1UF 50V 10% X5R 0603" H 6000 1300 60  0001 C CNN "Description"
	1    6000 1300
	1    0    0    -1  
$EndComp
$Comp
L C C23
U 1 1 52E54280
P 7800 1300
F 0 "C23" H 7850 1400 50  0000 L CNN
F 1 "1uF" H 7850 1200 50  0000 L CNN
F 2 "gsg-sm0603:GSG-0603" H 7800 1300 60  0001 C CNN
F 3 "" H 7800 1300 60  0001 C CNN
F 4 "Samsung" H 6000 1300 60  0001 C CNN "Manufacturer"
F 5 "CL10A105KB8NNNC" H 6000 1300 60  0001 C CNN "Part Number"
F 6 "CAP CER 1UF 50V 10% X5R 0603" H 6000 1300 60  0001 C CNN "Description"
	1    7800 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 52E54376
P 10300 1950
F 0 "#PWR011" H 10300 1950 30  0001 C CNN
F 1 "GND" H 10300 1880 30  0001 C CNN
F 2 "" H 10300 1950 60  0001 C CNN
F 3 "" H 10300 1950 60  0001 C CNN
	1    10300 1950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 52E5437C
P 7800 1550
F 0 "#PWR012" H 7800 1550 30  0001 C CNN
F 1 "GND" H 7800 1480 30  0001 C CNN
F 2 "" H 7800 1550 60  0001 C CNN
F 3 "" H 7800 1550 60  0001 C CNN
	1    7800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 1900 10300 1950
Wire Wire Line
	7800 1500 7800 1550
$Comp
L GND #PWR013
U 1 1 52E54509
P 7650 1950
F 0 "#PWR013" H 7650 1950 30  0001 C CNN
F 1 "GND" H 7650 1880 30  0001 C CNN
F 2 "" H 7650 1950 60  0001 C CNN
F 3 "" H 7650 1950 60  0001 C CNN
	1    7650 1950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 52E5450F
P 6000 1550
F 0 "#PWR014" H 6000 1550 30  0001 C CNN
F 1 "GND" H 6000 1480 30  0001 C CNN
F 2 "" H 6000 1550 60  0001 C CNN
F 3 "" H 6000 1550 60  0001 C CNN
	1    6000 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1900 7650 1900
Wire Wire Line
	6000 1500 6000 1550
Wire Wire Line
	10500 1100 10500 1050
Connection ~ 10500 1050
Wire Wire Line
	10200 1450 10300 1450
Wire Wire Line
	10300 1450 10300 1500
Wire Wire Line
	7600 1450 7650 1450
Wire Wire Line
	7650 1450 7650 1500
Wire Wire Line
	7650 1950 7650 1900
Wire Wire Line
	6000 1100 6000 1050
Connection ~ 6000 1050
$Comp
L C C26
U 1 1 52E5532C
P 10500 1300
F 0 "C26" H 10550 1400 50  0000 L CNN
F 1 "1uF" H 10550 1200 50  0000 L CNN
F 2 "gsg-sm0603:GSG-0603" H 10500 1300 60  0001 C CNN
F 3 "" H 10500 1300 60  0001 C CNN
F 4 "Samsung" H 6000 1300 60  0001 C CNN "Manufacturer"
F 5 "CL10A105KB8NNNC" H 6000 1300 60  0001 C CNN "Part Number"
F 6 "CAP CER 1UF 50V 10% X5R 0603" H 6000 1300 60  0001 C CNN "Description"
	1    10500 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 52E55332
P 10500 1550
F 0 "#PWR015" H 10500 1550 30  0001 C CNN
F 1 "GND" H 10500 1480 30  0001 C CNN
F 2 "" H 10500 1550 60  0001 C CNN
F 3 "" H 10500 1550 60  0001 C CNN
	1    10500 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 1500 10500 1550
Wire Wire Line
	7800 1100 7800 1050
Connection ~ 7800 1050
$Comp
L C C24
U 1 1 52E5542F
P 8800 1300
F 0 "C24" H 8850 1400 50  0000 L CNN
F 1 "1uF" H 8850 1200 50  0000 L CNN
F 2 "gsg-sm0603:GSG-0603" H 8800 1300 60  0001 C CNN
F 3 "" H 8800 1300 60  0001 C CNN
F 4 "Samsung" H 6000 1300 60  0001 C CNN "Manufacturer"
F 5 "CL10A105KB8NNNC" H 6000 1300 60  0001 C CNN "Part Number"
F 6 "CAP CER 1UF 50V 10% X5R 0603" H 6000 1300 60  0001 C CNN "Description"
	1    8800 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 52E55435
P 8800 1550
F 0 "#PWR016" H 8800 1550 30  0001 C CNN
F 1 "GND" H 8800 1480 30  0001 C CNN
F 2 "" H 8800 1550 60  0001 C CNN
F 3 "" H 8800 1550 60  0001 C CNN
	1    8800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 1500 8800 1550
Wire Wire Line
	8800 1050 8800 1100
Connection ~ 8800 1050
Text GLabel 10700 3100 2    60   Output ~ 0
REG_3V3
Wire Wire Line
	10700 3100 10650 3100
Connection ~ 10650 3250
Text GLabel 5350 3100 0    60   Output ~ 0
REG_3V3
Wire Wire Line
	5350 3100 5450 3100
Connection ~ 5450 3250
Text GLabel 7150 3100 2    60   Output ~ 0
REG_3V3
Wire Wire Line
	7050 3100 7150 3100
Connection ~ 7050 3250
Wire Wire Line
	1150 3150 1650 3150
Wire Wire Line
	6250 1050 6250 1450
Wire Wire Line
	6250 1450 6400 1450
Connection ~ 6250 1050
Text Notes 9950 2500 0    60   ~ 0
Disabled by default\nLEDS_PWR: 1=ON, 0=OFF\nTo be enabled/disabled by \nFPGA LED_ON pin OR by\nJUMPER POS 1-2
$Comp
L R R62
U 1 1 52E59BF7
P 8600 2150
F 0 "R62" V 8500 2150 50  0000 C CNN
F 1 "10k" V 8600 2150 50  0000 C CNN
F 2 "gsg-sm0603:GSG-0603" H 8600 2150 60  0001 C CNN
F 3 "" H 8600 2150 60  0001 C CNN
F 4 "Stackpole" H 8600 2150 60  0001 C CNN "Manufacturer"
F 5 "RMCF0603JT10K0" H 8600 2150 60  0001 C CNN "Part Number"
F 6 "RES 10K OHM 1/10W 5% 0603 SMD" H 8600 2150 60  0001 C CNN "Description"
F 7 "DNP" V 8400 2150 60  0000 C CNN "Note"
	1    8600 2150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR017
U 1 1 52E59BFD
P 8950 2450
F 0 "#PWR017" H 8950 2450 30  0001 C CNN
F 1 "GND" H 8950 2380 30  0001 C CNN
F 2 "" H 8950 2450 60  0001 C CNN
F 3 "" H 8950 2450 60  0001 C CNN
	1    8950 2450
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 P14
U 1 1 52E59C03
P 9400 2250
F 0 "P14" V 9350 2250 50  0000 C CNN
F 1 "CONN_3" V 9450 2250 40  0000 C CNN
F 2 "gsg-header-1x3:GSG-HEADER-1x3" H 9400 2250 60  0001 C CNN
F 3 "" H 9400 2250 60  0001 C CNN
F 4 "DNP" V 9600 2250 60  0000 C CNN "Note"
	1    9400 2250
	1    0    0    -1  
$EndComp
$Comp
L R R63
U 1 1 52E59C0D
P 8600 2350
F 0 "R63" V 8680 2350 50  0000 C CNN
F 1 "10k" V 8600 2350 50  0000 C CNN
F 2 "gsg-sm0603:GSG-0603" H 8600 2350 60  0001 C CNN
F 3 "" H 8600 2350 60  0001 C CNN
F 4 "Stackpole" H 8600 2350 60  0001 C CNN "Manufacturer"
F 5 "RMCF0603JT10K0" H 8600 2350 60  0001 C CNN "Part Number"
F 6 "RES 10K OHM 1/10W 5% 0603 SMD" H 8600 2350 60  0001 C CNN "Description"
	1    8600 2350
	0    -1   1    0   
$EndComp
Text GLabel 9000 1950 2    60   Input ~ 0
REG_3V3
Connection ~ 8950 2150
Wire Wire Line
	8850 2150 9050 2150
Connection ~ 8250 2250
Wire Wire Line
	8300 2250 8300 2350
Wire Wire Line
	8300 2350 8350 2350
Wire Wire Line
	8950 2450 8950 2350
Connection ~ 8950 2350
Wire Wire Line
	8850 2350 9050 2350
Wire Wire Line
	8250 2250 8250 2150
Wire Wire Line
	8250 2150 8350 2150
Connection ~ 8300 2250
$Comp
L R R61
U 1 1 52E59C22
P 8150 1950
F 0 "R61" V 8050 1950 50  0000 C CNN
F 1 "10k" V 8150 1950 50  0000 C CNN
F 2 "gsg-sm0603:GSG-0603" H 8150 1950 60  0001 C CNN
F 3 "" H 8150 1950 60  0001 C CNN
F 4 "Stackpole" H 8150 1950 60  0001 C CNN "Manufacturer"
F 5 "RMCF0603JT10K0" H 8150 1950 60  0001 C CNN "Part Number"
F 6 "RES 10K OHM 1/10W 5% 0603 SMD" H 8150 1950 60  0001 C CNN "Description"
	1    8150 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2250 9050 2250
Wire Wire Line
	8150 2250 8150 2200
Wire Wire Line
	8950 2150 8950 1950
Wire Wire Line
	8950 1950 9000 1950
Text GLabel 1850 3900 0    39   Input ~ 0
LEDS_PWR
Text GLabel 8150 1600 1    39   Input ~ 0
LEDS_PWR
Wire Wire Line
	9000 1450 8900 1450
Wire Wire Line
	8900 1450 8900 1650
Wire Wire Line
	8900 1650 8150 1650
Wire Wire Line
	8150 1600 8150 1700
Connection ~ 8150 1650
Wire Wire Line
	2450 3900 1850 3900
Text Label 2200 3900 2    60   ~ 0
FE_A8
Text Notes 2350 6700 0    60   ~ 0
REG_3V3 and REG_3V3_LED Power outputs
Wire Wire Line
	1750 2150 1750 2050
$Comp
L R R64
U 1 1 5457C4F0
P 3850 2550
F 0 "R64" V 3930 2550 50  0000 C CNN
F 1 "10k" V 3850 2550 50  0000 C CNN
F 2 "gsg-sm0603:GSG-0603" H 3850 2550 60  0001 C CNN
F 3 "" H 3850 2550 60  0001 C CNN
F 4 "Stackpole" H 3850 2550 60  0001 C CNN "Manufacturer"
F 5 "RMCF0603JT10K0" H 3850 2550 60  0001 C CNN "Part Number"
F 6 "RES 10K OHM 1/10W 5% 0603 SMD" H 3850 2550 60  0001 C CNN "Description"
F 7 "~" V 3950 2350 60  0000 C CNN "Note"
	1    3850 2550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3850 2800 3850 2900
Connection ~ 3850 2900
Text Label 4450 2200 2    60   ~ 0
VRAW_SW_5V
Wire Wire Line
	3850 2300 3850 2200
Wire Wire Line
	3850 2200 4450 2200
$Comp
L C C27
U 1 1 5457D5DE
P 650 1250
F 0 "C27" H 700 1350 50  0000 L CNN
F 1 "0.1uF" H 700 1150 50  0000 L CNN
F 2 "gsg-sm0603:GSG-0603" H 650 1250 60  0001 C CNN
F 3 "" H 650 1250 60  0001 C CNN
F 4 "Johanson Dialectrics" H -6750 1050 60  0001 C CNN "Manufacturer"
F 5 "160R14W104KV4T" H -6750 1050 60  0001 C CNN "Part Number"
F 6 "CAP CER 0.1UF 16V 10% X7R 0603" H -6750 1050 60  0001 C CNN "Description"
F 7 "http://www.digikey.com/product-detail/en/160R14W104KV4T/709-1153-1-ND/1859485" H -6750 1050 60  0001 C CNN "Field7"
	1    650  1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  1450 650  1550
Wire Wire Line
	650  950  1850 950 
Wire Wire Line
	650  950  650  1050
Wire Wire Line
	1750 950  1750 1050
Connection ~ 1750 950 
Wire Wire Line
	8750 2900 8550 2900
Wire Wire Line
	10550 3900 9950 3900
NoConn ~ 9950 4100
NoConn ~ 9950 4200
$EndSCHEMATC
