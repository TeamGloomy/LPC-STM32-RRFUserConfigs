; Configuration file for Duet WiFi (firmware version 3)
; executed by the firmware on start-up
; by Pini
; General preferences
G90                                                         ; send absolute coordinates...
M83                                                         ; ...but relative extruder moves
M550 P"PiniX"                                               ; set printer name

; Network
M552 S1                                                     ; enable network
M586 P0 S1                                                  ; enable HTTP
M586 P1 S0                                                  ; disable FTP
M586 P2 S0                                                  ; disable Telnet

; Drives
M569 P0 S1 D3 V10                                            ; physical drive 0 goes forwards
M569 P1 S1                                              		 ; physical drive 1 goes forwards
M569 P2 S1                                              		 ; physical drive 2 goes forwards
M569 P3 S1 D3 V10												  				           ; Physical drive 3 goes forwards (X2 on e0)
M569 P4 S1 																		               ; Physical drive 4 goes forwards (Z2 on e1)
M569 P5 S0                                                   ; physical drive 8 goes backwards
M569 P6 S0                                                   ; physical drive 9 goes backwards

; Drive mapping
M584 X0 Y1 Z2:4 U3 E5:6 P4				       ; Drive mapping X=0, Y=1, Z=2 and 3, X2=U=4 and Z2=V=3, extruder motors 8 and 9. Drive 2 and 4 is combined Z. 4 axes are visible				

M350 X16 Y16 Z16 U16 I1  	        	     ; Configure microstepping with interpolation
M350 E16:16 I1  	        			         ; Configure microstepping with interpolation

; Motion parameters
M92 X80.00 Y80.00 Z800.00 U80.00 V800.00 E396.00:396.00			                             ; Set steps per mm
M566 X480.00 Y480.00 Z120.00 U480.00 V120.00 E640.00:640.00                              ; set maximum instantaneous speed changes (mm/min)
M201 X1200.00 Y1200.00 Z200.00 U1200.00 V200.00 E6400.00:6400.00                         ; set accelerations (mm/s^2)
M203 X12000.00 Y12000.00 Z400.00 U12000.00 V400.00 E20000.00:20000.00                    ; set maximum speeds (mm/min)
M906 X1100 Y1800 Z1100 U1100 V1100 E1330:1330 I20                                        ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                                                                  ; Set idle timeout

; Axis Limits
M208 X-188 Y-155 Z0 U-135 V0 S1 							                       ; Set axis minima
M208 X135 Y155 Z350 U188 V350 S0 							                       ; Set axis maxima

; Endstops
M574 X1 S1 P"!xstop"                                                               ; configure active-low endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                                                                ; configure active-low endstop for low end on Y via pin ystop
M574 Z1 S1 P"!zstop+!zstopmax"                                                     ; Z axis with two motors, individual min endstops, active high
M574 U2 S1 P"!xstopmax"                                                            ; configure active-low endstop for high end on X2 via pin xstopmax


; Z-Probe
M950 S0 C"Servo0"                                                                  ; create Z3 for BLTouch on pin Servo0
M558 P9 C"^Z3" H5 F120 T6000                                                       ; set Z probe type to bltouch and the dive height + speeds on pin Z3
G31 X12 Y38 Z2.115 P25                                                             ; set Z probe trigger value, offset and trigger height
M557 X-145:120 Y-116:140 P6:6                                                      ; define mesh grid


; Heaters and sensors
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138 	                                   ; configure sensor 0 as thermistor on pin bedtemp

M308 S1 P"PA0" Y"thermistor" T100000 B4725 C7.06e-8                                ; configure sensor 1 as thermistor on pin PA0

M308 S2 P"e1temp" Y"thermistor" T100000 B4725 C7.06e-8                             ; configure sensor 2 as thermistor on pin e1temp

M308 S3 Y"mcu-temp" A"MCU" 								                                         ; Configure sensor for MCU



M950 H0 C"hbed" T0                                                                      ; create bed heater output on hbed and map it to sensor 0
M307 H0 R0.680 C494.9 D7.08 S1.00 V0.0                                                  ; disable bang-bang mode for the bed heater and set PWM limit
M143 H0 S100                                                                            ; set temperature limit for heater 0 to 120C
M140 H0                                                                                 ; map heated bed to heater 0

M950 H1 C"he5" T1                                                                       ; create nozzle heater output on he5 and map it to sensor 1
M143 H1 S300                                                                            ; set temperature limit for heater 1 to 300C
M307 H1 R1.909 C166.0 D4.86 S1.00 V0.0                                                  ; disable bang-bang mode for heater  and set PWM limit

M950 H2 C"he4" T2                                                                       ; create nozzle heater output on he4 and map it to sensor 2
M143 H2 S300                                                                            ; set temperature limit for heater 2 to 300C
M307 H2 R1.841 C48.8 D6.13 S1.00 V0.0                                                   ; disable bang-bang mode for heater  and set PWM limit

; Fans
M950 F0 C"PA2" Q500                                                                     ; create fan 0 on pin PA2 and set its frequency  -- HOTEND FAN left
M106 P0 S0 H1 T45                                                                       ; set fan 0 value. Thermostatic control is turned on -- HOTEND FAN left
M950 F1 C"PA1" Q500                                                                     ; create fan 1 on pin PA1 and set its frequency -- HOTEND FAN  right
M106 P1 S0 H2 T45                                                                       ; set fan 1 value. Thermostatic control is turned on -- HOTEND FAN right

M950 F2 C"PE13" Q1000                                                                   ; create fan 2 on pin PE13 and set its frequency -- TOOL FAN left
M106 P2 S0 H-1 C"Bauteil links"	                                         	              ; set fan 2 value. Thermostatic control is turned off -- TOOL FAN left
M950 F3 C"PF9" Q1000                                                                    ; create fan 3 on pin PF9 and set its frequency -- TOOL FAN right
M106 P3 S0 H-1 C"Bauteil rechts"                                        		            ; set fan 3 value. Thermostatic control is turned off -- TOOL FAN right



; Tools
M563 P0 S"LeftHead" D0 H1 F2                                							; define tool 0
G10 P0 X0 Y0 Z0 U0                                          							; set tool 0 axis offsets
G10 P0 R0 S0                                                							; set initial tool 0 active and standby temperatures to 0C

M563 P1 S"RightHead" D1 H2 F3 X3                            							; define tool 1, ports X axis to U motor 3
G10 P1 X0 Y0 Z0 U0.83                                       							; set tool 1 axis offsets
G10 P1 R0 S0                                                              ; set initial tool 1 active and standby temperatures to 0C

; DUPLICATION TOOL - T2  
;Use "M579 U-1" in start slicers start script for mirror mode
M563 P2 D0:1 H1:2 X0:3 F2:3		                           								; Tool 2 uses both extruders and hotend heaters, maps X to both X and U, and uses both print cooling fans 2 and 3
G10 P2 X77 Y0 U-77 S0 R0    	                            							; Set tool offsets and temperatures for tool 2 - moves X 77 left and U 77 right
M567 P2 E1.00:1.00 				           											              ; Set mix ratio 100% on both extruders

;Filament runout sensor


; Automatic saving after power loss is enabled

; Miscellaneous
M501                                                        ; load saved parameters from non-volatile memory
M575 P1 S0 B57600                                           ; enable support for Flymaker 4.3/7" screen

