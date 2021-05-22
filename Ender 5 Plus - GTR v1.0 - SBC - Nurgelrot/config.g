; Configuration file for SKR GTR v1.0 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.2.1-LPC+11 on Wed May 12 2021 15:02:57 GMT-0600 (Mountain Daylight Time)
; further tuned and customized for the Creality Ender 5 Plus

; General preferences
G90                                             ; send absolute coordinates...
M83                                             ; ...but relative extruder moves
M550 P"Dabus-E5Pd"                              ; set printer name


; Drives BTT TMc2209 v1.2's in UART mode.
M569 P0 S0 V40                                     ; physical drive 0 goes forwards using default driver timings
M569 P1 S0 V40                                     ; physical drive 1 goes forwards using default driver timings
M569 P2 S0 V40                                     ; physical drive 2 goes forwards using default driver timings
M569 P3 S1 D2                                      ; physical drive 3 goes backwards using Spreadcycle
M569 P4 S0 V40                                     ; physical drive 4 goes forwards using default driver timings
M584 X0 Y1 Z2:4 E3                                 ; set drive mapping with dual Z
M350 X16 Y16 Z16 E16 I1                            ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z800.00 E415.00                  ; set steps per mm Bondtech BMG extruder
M566 X1200.00 Y1200.00 Z24.00 E300.00              ; set maximum instantaneous speed changes (mm/min)
M203 X9000.00 Y9000.00 Z600.00 E6000.00            ; set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z100.00 E5000.00              ; set accelerations (mm/s^2)
M906 X580 Y600 Z650 E650 I30                       ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                            ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                ; set axis minima
M208 X360 Y360 Z400 S0                          ; set axis maxima, getting a bit more space out of the bed.

; Endstops
M574 X2 S1 P"xstop"                             ; configure active-high endstop for high end on X via pin xstop
M574 Y2 S1 P"ystop"                             ; configure active-high endstop for high end on Y via pin ystop
M574 Z1 S2                                      ; configure Z-probe endstop for low end on Z

; Filliment sensor
M591 D0 P1 C"e0stop" S1							: Simple swtch tiype sensor

; Z-Probe
M950 S0 C"servo0"                               ; create servo pin 0 for BLTouch
M558 P9 C"^zstop" H5 F120 T7000                 ; set Z probe type to bltouch and the dive height + speeds, trigger wired to zstop as per creality norm.
G31 P500 X-45 Y-7 Z1.68                         ; set Z probe trigger value, offset and trigger height
M671 X-23:386 Y180:180 S3	                    ; Define lead scew locations
M557 X5:315 Y5:347 P5:5                         ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4092  ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                               ; create bed heater output on bed and map it to sensor 0
M307 H0 B0 S1.00                                ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                         ; map heated bed to heater 0
M143 H0 S120                                    ; set temperature limit for heater 0 to 120C
M143 H0 S120                                    ; set temperature limit for heater 0 to 120C
M308 S1 P"e0temp" Y"thermistor" T100000 B4092   ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                            ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                                ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                    ; set temperature limit for heater 1 to 280C
M308 S3 Y"mcu-temp" A"MCU"                      ; configure sensor 3 as board temp monitor


; Fans
M950 F0 C"fan0" Q500                            ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                  ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                            ; create fan 1 on pin fan1 and set its frequency
M106 P1 S0 H3 T25                               ; set fan 1 value. Thermostatic control is turned on
M950 F2 C"fan2" Q500                            ; create fan 2 on pin fan2 and set its frequency
M106 P2 S0 H1 T45                               ; set fan 2 value. Thermostatic control is turned on

; Tools
M563 P0 S"MircoSwiss" D0 H1 F0                  ; define tool 0
G10 P0 X0 Y0 Z0                                 ; set tool 0 axis offsets
G10 P0 R0 S0                                    ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; Miscellaneous
M575 P1 S1 B57600                               ; enable support for PanelDue
T0                                              ; select first tool
M501 											; pulling Config overrides file...

