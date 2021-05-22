; Configuration file for SKR Pro (firmware version 3)
; executed by the firmware on start-up
; MaracMB for Raffa
; General preferences
G90                                             ; send absolute coordinates...
M83                                             ; ...but relative extruder moves
M550 P"D3IDEX"                                  ; set printer name
; Network
M552 S1                                         ; enable network
M586 P0 S1                                      ; enable HTTP
M586 P1 S0                                      ; disable FTP
M586 P2 S0                                      ; disable Telnet
; Drives
M569 P0 S1                                      ; physical drive 0 goes forwards using default driver timings
M569 P1 S1                                      ; physical drive 1 goes forwards using default driver timings
M569 P2 S0                                      ; physical drive 2 goes forwards using default driver timings
M569 P3 S0                                      ; physical drive 3 goes forwards using default driver timings
M569 P4 S1                                      ; physical drive 4 goes forwards using default driver timings
M569 P5 S1                                      ; physical drive 4 goes forwards using default driver timings
; Mapping steppers
M584 X0 Y1 Z2 U5 E3:4                           ; set drive mapping
M350 X16 Y16 U16 Z16 E16:16 I1                      ; configure microstepping with interpolation
M906 X850 Y900 Z800 U850 E800:800 I30                ; set motor currents (mA) and motor idle factor in per cent
M92 X80.00 Y80.00 U80 Z400.00 E404.17:404.17      ; set steps per mm
; Axis Limits
M208 X-207 Y-147 U-140 Z0 S1                                ; set axis minima
M208 X145 Y124 U215.03 Z350 S0                          ; set axis maxima
; Movement dynamics
M203 X16000.00 Y12000.00 U16000.00 Z1000.00 E12000.00:12000.00 ; set maximum speeds (mm/min)
M201 X1000.00 Y800.00 Z125.00 U1000.00 E3500.00:3500.00      ; set accelerations (mm/s^2)
M566 X480.00 Y480.00 U480.00 Z60.00 E1500.00:1500.00      ; set maximum instantaneous speed changes (mm/min)
M593 F40
M204 P800 T2400
M84 S30                                         ; Set idle timeout
; Endstops
M574 X1 S1 P"xstop"                             ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"!ystop"                             ; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S1 P"!zstop"                             ; configure active-high endstop for low end on Z via pin zstop
M574 U2 S1 P"e0stop"                             ; U max active high endstop switch
; Z-Probe
;M558 P0 H5 F120 T6000                           ; disable Z probe but set dive height, probe speed and travel speed
;M557 X15:215 Y15:195 S20                        ; define mesh grid
; Heaters
M308 S0 P"e0temp" Y"thermistor" T100000 B4725 C7.06e-8          ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                                      ; create bed heater output on bed and map it to sensor 0
M307 H0 R0.204 C451.3 D0.42 S1.00 V0.0                                       ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                ; map heated bed to heater 0
M143 H0 S110                                           ; set temperature limit for heater 0 to 110C
M143 H0 S110                                           ; set temperature limit for heater 0 to 110C
M308 S1 P"e1temp" Y"pt1000" R4700                      ; configure sensor 1 as PT1000 on pin e0temp
M950 H1 C"e0heat" T1                                   ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 R1.694 C350.9:291.6 D9.69 S1.00 V0.0                                       ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S360                                           ; set temperature limit for heater 1 to 360C
M308 S2 P"e2temp" Y"thermistor" T100000 B4725 C7.06e-8 ; configure sensor 2 as thermistor on pin e1temp
M950 H2 C"e1heat" T2                                   ; create nozzle heater output on e1heat and map it to sensor 2
M307 H2 R1.760 C371.5:262.4 D7.58 S1.00 V0.0                                       ; disable bang-bang mode for heater  and set PWM limit
M143 H2 S280                                           ; set temperature limit for heater 2 to 280C
; Fans
M950 F0 C"fan0" Q500                                   ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                         ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                                   ; create fan 1 on pin fan1 and set its frequency
M106 P1 S0 H-1                                         ; set fan 1 value. Thermostatic control is turned off
; Tools
M563 P0 X0 D0 H1 F0                                       ; define tool 0
G10 P0 X0 Y0 Z0                                        ; set tool 0 axis offsets
G10 P0 R0 S0                                           ; set initial tool 0 active and standby temperatures to 0C
M563 P1 D1 H2 X3 F1                                       ; define tool 1
G10 P1 X0 U-0.3 Y-1.2 Z0                                        ; set tool 1 axis offsets
G10 P1 R0 S0                                           ; set initial tool 1 active and standby temperatures to 0C
M563 P2 D0:1 H1:2 X0:3 F0:1                            ; define ditto tool 2
G10 P2 X-77 U-77 Y0 Z0                                    ; set tool 2 axis offsets
G10 P2 R0 S0                                           ; set initial tool 1 active and standby temperatures to 0C
; Custom settings
; Automatic saving after power loss
M911 S23.00 R23.50 P"M913 X0 Y0 U0 G91 M83 G1 Z2 E-4 F3000" ; Set voltage thresholds and actions to run on power loss
; Miscellaneous
M501 												; read config-override for PID values
M575 P1 S2 B115200                             ; enable support for tft
T0                                              ; select first tool
M572 D0 S0.1                                     ; pressure advance
M572 D1 S0.1                                     ; pressure advance