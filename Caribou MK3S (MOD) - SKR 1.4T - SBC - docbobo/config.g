; =====================================================================================================================
; General preferences
; =====================================================================================================================
G90                                                                            ; send absolute coordinates...
M83                                                                            ; ...but relative extruder moves
M404 N1.75 D0.4                                                                ; define filament and nozzle diameters for volumetric extrusion

; =====================================================================================================================
; Network settings
; =====================================================================================================================
; When running the SBC firmware, the following settings are either not required, or they might prevent the printer
; from being configured correctly at all. Especially setting the printer name to something different than the hostname
; of the SBC  causes problems.
;
; When running the WIFI firmware, the lines in this section need to be commented in.
; =====================================================================================================================
;M550 P"Caribou MK3s 220"                                                      ; set printer name
;M552 S1                                                                       ; enable network
;M586 P0 S1                                                                    ; enable HTTP
;M586 P1 S0                                                                    ; disable FTP
;M586 P2 S0                                                                    ; disable Telnet

; =====================================================================================================================
; Drives
; =====================================================================================================================
; The following section assumes that the motors are wired as described in @codiac2600's SKR Bear wiring guide.
; (https://github.com/codiac2600/SKR-MK3s-V1.4-Beta/blob/master/SKR%20MK3s%20Wire%20Guide.pdf)
;
; For Caribous, the X, Y, and E motors need to move backward (S0), while the Z motors are moving forward.
; The D3 setting enables Stealth Chop (when running e.g. TMC2209 drivers). The V setting configures the speed at which
; the switch between Stealth Chop and Spread Cycle occurs. The values are chosen to closely match those from
; @codiac2600's Marlin 2.x builds:
;
;     V68  = 110.3 mm/sec
;     V600 = 3.1 mm/sec
;
; This can be checked via M569 P0 (or P1, P2, P3, P4) 
; =====================================================================================================================
M569 P0 S0 D3 V68                                                              ; [X] physical drive 0 goes backwards
M569 P1 S0 D3 V68                                                              ; [Y] physical drive 1 goes backwards
M569 P2 S1 D3 V600                                                             ; [Z1] physical drive 2 goes forwards
M569 P3 S0                                                                     ; [E] physical drive 3 goes backwards
M569 P4 S1 D3 V600                                                             ; [Z2] physical drive 4 goes forwards
M584 X0 Y1 Z2:4 E3                                                             ; map the defined motors to the axis
M906 X650 Y700 Z450 E550 I30                                                   ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                                                        ; set motor idle timeout to 30 seconds

; The 0.9° motor on the BMG extruder uses 32 microstepping
M350 X16 Y16 Z16 E32 I1                                                        ; configure microstepping with interpolation
M92 X100.00 Y100.00 Z400.00 E830.00                                            ; set steps per mm
M566 X360.0 Y360.0 Z360.0 E360.0                                               ; set maximum instantaneous speed changes (mm/min)
M203 X15000.00 Y15000.00 Z1800.00 E4800.00                                     ; set maximum speeds (mm/min) (E was 7200)
M201 X2500.00 Y2500.00 Z100.00 E10000.00       		  	                       ; set accelerations (mm/s^2)

; =====================================================================================================================
; Axis Limits
; ===========
; The dimensions of the Caribou are usually quoted as X=250mm, Y=210mm, Z=217mm. 
; At least my build seems to have a slightly bigger build volume on the Y axis, going from -5 to 215.
;
; M671 defines the position of the lead screws for the Z axis, required to do proper alignment of the Z motors.
; =====================================================================================================================
M208 X0 Y-5 Z0 S1                                                              ; set axis minima
M208 X250 Y215 Z217 S0                                                         ; set axis maxima

M671 X-5:255 Y105:105 S1                                                       ; leadscrews at left (connected to Z) and right (connected to E1) of X axis

; =====================================================================================================================
; Mesh Compenstion
; =====================================================================================================================
M557 X10:225 Y5:174 P7:7                 				                       ; define mesh grid
M376 H10                                                                       ; fade over 10mm

; =====================================================================================================================
; Endstops
; ========
; The Caribou MK3s uses sensorless endstops for both the X and Y axis. In addition, I've replaced the PINDA probe, that
; would be the low endstop for the Z axis, with a BLTouch.
; =====================================================================================================================
M574 X1 S3                                                                     ; configure sensorless endstop for X
M574 Y1 S3                                                                     ; configure sensorless endstop for Y
M574 Z1 S2                                                                     ; configure Z-probe endstop for low end on Z
M915 X Y H200 R0 F0 S40                                                        ; configure motor stall detection

; =====================================================================================================================
; Z-Probe (BLTouch)
; =====================================================================================================================
M558 P9 H7 A3 B0 F500 S0.03 T8000 X0 Y0 Z1 C"^probe"                           ; disable Z probe but set dive height, probe speed and travel speed
M950 S0 C"servo0"                              		   	                       ; setup servo 0 as servo port on SKR
G31 X-24.3 Y-34.1 Z0                                                           ; probe offset

; =====================================================================================================================
; Heaters
; =====================================================================================================================

; Heatbed
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138                                 ; configure sensor 1 as thermistor on pin e1temp
M950 H0 C"bed" T0                                                              ; create bed heater output on e1heat and map it to sensor 0
M307 H0 B0 S1.00                                                               ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                                        ; map heated bed to heater 0
M143 H0 S130                                                                   ; set temperature limit for heater 0 to 130C

; Hotend (Mosquito Magnum w/ Slice Thermistor)
M308 S1 P"e0temp" Y"thermistor" T500000 B4723 C1.19622e-7                      ; configure sensor 0 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                                           ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                                                               ; disable bang-bang mode for heater and set PWM limit
M143 H0 S365                                                                   ; set temperature limit for heater 1 to 365C

; =====================================================================================================================
; Filament Sensor
; ===============
; Configuration for a Prusa style MK3s filament sensor
; =====================================================================================================================
M591 D0 P1 C"e0stop" S1                                                        ; Prusa filament sensor signals HIGH when filament is present

; =====================================================================================================================
; Fans
; ====
; The wiring diagram mentioned above uses FAN0 connector for the Part Cooling fan, and FAN1 for Hotend Cooling. However,
; the correct connector for Hotend Cooling would HE1. 
;
; The configuration below inverts that: It uses FAN0 for Hotend Cooling and HE1 for Part Cooling. To configure this in
; such a way that it matches the description above, the C parameters of both M950 commands below need to be swapped.
; =====================================================================================================================
M950 F0 C"e1heat" Q15                                                          ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1 B0.25 L0.25 C"Part Cooling"                                     ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan0" T1                                                             ; create extruder fan output (2.4) on e1heat and map it to sensor 1 (T1)
M106 P1 H1 T45 S1 C"Hotend Cooling"                                            ; set fan 1 value. Thermostatic control is turned on

; =====================================================================================================================
; Tools
; =====================================================================================================================
M563 P0 S"Nozzle" D0 H1 F0                                                     ; define tool 0
G10 P0 X0 Y0 Z0                                                                ; set tool 0 axis offsets
G10 P0 R0 S0                                                                   ; set initial tool 0 active and standby temperatures to 0C

M501                                                                           ; load stored settings from config-override.g
T0                                                                             ; select tool 0