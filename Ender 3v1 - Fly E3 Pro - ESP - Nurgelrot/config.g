; Configuration file for Fly-E3-Pro (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.3.0-LPC-STM32+01 on Sat Aug 07 2021 19:06:06 GMT-0600 (Mountain Daylight Time)

; General preferences
G90                                              ; send absolute coordinates...
M83                                              ; ...but relative extruder moves
M550 "YourPinter"                                    ; set printer name

; Network
M552 S1                                          ; enable network
M586 P0 S1                                       ; enable HTTP
M586 P1 S0                                       ; disable FTP
M586 P2 S0                                       ; disable Telnet

; Drives
M569 P0 S0 V40                                   ; X physical drive 0 goes backwards using TMC2209 driver timings
M569 P1 S0 V40                                   ; Y physical drive 1 goes backwards using TMC2209 driver timings
M569 P2 S1 V20                                   ; ZL physical drive 2 goes forwards using TMC2209 driver timings
M569 P3 S0 D2                                    ; E physical drive 3 goes backwards using TMC2209 driver timings
M569 P4 S1 V20                                   ; ZR physical drive 4 goes forwards using TMC2209 driver timings
M584 X0 Y1 Z2:4 E3                               ; set drive mapping
M350 X16 Y16 Z16 E16 I1                          ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z400.00 E415                   ; set steps per mm
M566 X1200.00 Y1200.00 Z60.00 E360.00            ; set maximum instantaneous speed changes (mm/min)
M203 X9000.00 Y9000.00 Z1800.00 E6000.00         ; set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z100.00 E5000.00            ; set accelerations (mm/s^2)
M906 X650 Y650 Z700 E700 I30                     ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                          ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                 ; set axis minima
M208 X230 Y225 Z230 S0                           ; set axis maxima

; Endstops
M574 X1 S1 P"xstop"                              ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                              ; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S2                                       ; configure Z-probe endstop for low end on Z
M591 D0 P7 C"e0stop" L7 R50:200 E15 S1           ; Filiment Run out Sensor

; Z-Probe
M950 S0 C"servo0"                                ; create servo pin 0 for BLTouch
M558 P9 C"^probe" H5 F400:120 A6                 ; set Z probe type to bltouch and the dive height + speeds
; Prove Offset here
G31 P500 X-45 Y-7 Z3.340                          ; set Z probe trigger value, offset and trigger height 

M557 X10:185 Y10:215 P5:5                         ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T98801 B4185    ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                                ; create bed heater output on bed and map it to sensor 0
M307 H0 B0 S1.00                                 ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                          ; map heated bed to heater 0
M143 H0 S120                                     ; set temperature limit for heater 0 to 120C
M143 H0 S120                                     ; set temperature limit for heater 0 to 120C
M308 S1 P"e0temp" Y"thermistor" T98801 B4185     ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                             ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                                 ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S245                                     ; set temperature limit for heater 1 to 245C
M308 S2 P"mcutemp" Y"mcutemp" A"FlyE3-Pro"       ; CPU temp sensor

; Fans
M950 F0 C"fan0"                                  ; create fan 0 on pin fan0 and set its frequency
M106 P0 C"Part Cooling Fan" S0 H-1               ; set fan 0 name and value. Thermostatic control is turned off
M950 F1 C"fan1"                                  ; create fan 1 on pin fan1 and set its frequency
M106 P1 C"Hotend Fan" S0.01 H1 T45               ; set fan 1 name and value. Thermostatic control is turned on
M950 F2 C"fan3"                                  ; create fan 2 on pin fan3 and set its frequency
M106 P2 C"Case Fan" S0.01 H2 T30                 ; set fan 2 name and value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0                                 ; define tool 0
G10 P0 X0 Y0 Z0                                  ; set tool 0 axis offsets
G10 P0 R0 S0                                     ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; Miscellaneous
M575 P1 S1 B57600                                 ; enable support for PanelDue
M501                                               ; load saved parameters from non-volatile memory
M911 S10 R11 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; set voltage thresholds and actions to run on power loss
T0                                                 ; select first tool

