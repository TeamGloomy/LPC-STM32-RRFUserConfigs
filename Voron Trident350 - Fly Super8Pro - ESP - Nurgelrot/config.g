; Configuration file for Fly Super8 Pro H723 (firmware version 3)
; executed by the firmware on start-up
;
; Sun Apr 09 2023 19:37:03 GMT-0600 (Mountain Daylight Time)

; General preferences
G90                                                 ; send absolute coordinates...
M83                                                 ; ...but relative extruder moves
M550 P"SecretSanta"                                 ; set printer name
M669 K1                                             ; select CoreXY mode
G4 S5   				                            ;wait 4s for expansion boards to start
                                                    ;
;==================================                 ;
; Network                                           ;
;==================================                 ;
M552 S1                                             ; enable network
M586 P0 S1                                          ; enable HTTP
M586 P1 S0                                          ; disable FTP
M586 P2 S0                                          ; disable Telnet
                                                    ;
;==================================                 ;
; Drives                                            ;
;==================================                 ;
; Z axis _____                                      ;    
;        |0.1|                                      ;
;    _____---_____                                  ;    
;    |0.0|   |0.2|                                  ;
;     ---     ---                                   ;
M569 P0.0 S1 D3                                     ; physical drive 0.0 goes forwards using default driver timings in Stealthchop  |Z0
M569 P0.1 S1 D3                                     ; physical drive 0.1 goes forwards using default driver timings in Stealthchop |Z1
M569 P0.2 S1 D3                                     ; physical drive 0.2 goes forwards using default driver timings in Stealthchop  |Z2
; X/Y & E
M569 P0.3 S0 D2                                     ; physical drive 0.3 goes forwards using default driver timings in Spreadcycle  |B(x)
M569 P0.4 S0 D2                                     ; physical drive 0.4 goes forwards using default driver timings in Spreadcycle  |A(y)
M569 P124.0 S1 D2                                   ; physical drive 124.0 goes forwards using default driver timings in Spreadcycle on SB2040 tool-board

M584 X0.4 Y0.3 Z0.0:0.1:0.2 E124.0                  ; set drive mapping
M350 X16 Y16 Z16 E16 I1                             ; configure microstepping with interpolation
M92 X160.00 Y160.00 Z800.00 E708.00                 ; set steps per mm. [NOTE .9 motors on X/Y]
                                                    ;
;==================================                 ;
; Speeds                                            ;
;==================================                 ;
M566 X500.00 Y500.00 Z120.00 E300.00                ; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 Z800.00 E7200.00           ; set maximum speeds (mm/min)
M201 X8000.00 Y8000.00 Z350.00 E2000.00             ; set accelerations (mm/s^2)
M906 X1000 Y1000 Z1000 E700 I30                     ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                             ; Set idle timeout
                                                    ;
;==================================                 ;
; Axis Limits                                       ;
;==================================                 ;
M208 X0 Y0 Z0 S1                                    ; set axis minima
M208 X350 Y350 Z240 S0                              ; set axis maxima -Stock Trident, short Z NOT CUBED
                                                    ;
;==================================                 ;
; Endstops                                          ;
;==================================                 ; X/Y endstop on Voron pcb w/cable X+gnd to io1 Y to io2 -No voltage
M574 X2 S1 P"io1"                                   ; configure switch-type (e.g. microswitch) endstop for high end on X via pin io1
M574 Y2 S1 P"io2"                                   ; configure switch-type (e.g. microswitch) endstop for high end on Y via pin io2
                                                    ;
;==================================                 ;
; Z-Probe (TAP)                                     ;    
;==================================                 ; Voron OptoTAP pcb 5V|sig|gnd on 124.io0
M558 P8 C"124.io0.in" H5 F600:120 T18000 A5 S0.01  ; set Z probe type to switch and the dive height + speeds
G31 P500 X0 Y0 Z-0.875                              ; set Z probe trigger value, offset and trigger height
M671 X-50:175:400 Y18:398:18 S5                     ; define positions of Z leadscrews or bed levelling screws -VORON Trident 350 bed.
M557 X15:335 Y15:335 P10                            ; define mesh grid
                                                    ;
;==================================                 ;
; Heaters                                           ;
;==================================                 ;
; Bed                                               ;
M308 S0 P"out3" Y"thermistor" T100000 B4130         ; configure sensor 0 as thermistor on pin ADC_0
M950 H0 C"bed" T0                                   ; create bed heater output on bed and map it to sensor 0
M307 H0 B0 S1.00                                    ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                             ; map heated bed to heater 0
M143 H0 S120                                        ; set temperature limit for heater 0 to 120C
; Tool 0                                            ;
M308 S1 P"124.temp0" Y"thermistor" T100000 B4138    ; configure sensor 1 as thermistor on pin ADC_1
M950 H1 C"124.out0" T1                              ; create nozzle heater output on heat0 and map it to sensor 1
M307 H1 B0 S1.00                                    ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                        ; set temperature limit for heater 1 to 280C
                                                    ;
;==================================                 ;
; Sensors                                           ;
;==================================                 ;
M308 S3 A"Super8" Y"mcu-temp"                       ; Sensor 3 Built in temp monitor in STM32H7
M308 S4 A"SB2040" Y"mcu-temp" P"124.dummy"          ; Sensor 4 Built in temp monitor in RP2040
                                                    ;
;==================================                 ;
; Fans                                              ;
;==================================                 ;
M950 F0 C"124.out1" Q100                            ; create fan 0 on pin 124.out1 and set its frequency
M106 P0 S0 H-1                                      ; set fan 0 value. Thermostatic control is turned off PART COOLING TOOL 0
M950 F1 C"124.out2" Q100                            ; create fan 1 on pin 124.out2 and set its frequency
M106 P1 S1.0 H1 T45                                 ; set fan 1 value. Thermostatic control is turned to hotend 45+ HEATSINK
M950 F2 C"124.out3" Q100                            ; create fan 2 on pin 124.out3 and set its frequency
M106 P2 H4 T50                                      ; set fan 2 value. Thermostatic control is turned to SB2040 50+ TOOL_PCB
                                                    ;
M950 F3 C"0.fan0" Q100                              ; create fan 3 on pin 0.fan0 and set its frequency
M106 P3 H3 S1.0 T35                                 ; set fan 3 value. hermostatic control is turned to 45 + RIGHT ELEC CASE
M950 F4 C"0.fan1" Q100                              ; create fan 4 on pin 0.fan0 and set its frequency
M106 P4 H3 S1.0 T35                                 ; set fan 4 value. 3 value. hermostatic control is turned to 45+ LEFT ELEC CASE
                                                    ;
;==================================                 ;
; Tools                                             ;
;==================================                 ;
M563 P0 S"Rapido" D0 H1 F0                          ; define tool 0
G10 P0 X0 Y0 Z0                                     ; set tool 0 axis offsets
G10 P0 R0 S0                                        ; set initial tool 0 active and standby temperatures to 0C
                                                    ;
;==================================                 ;
; DISPLAY                                           ;
;==================================                 ;
M98 P"screen.g"                                     ; Load the Mini12864 and set up its lighting
                                                    ;
;==================================                 ;
; Miscellaneous                                     ;
;==================================                 ;    
M572 D0 S0.025	                                    ; PA
T0                                                  ; select first(default) tool
M501                                                ; read config-override.g