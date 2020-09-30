; =====================================================================================================================
; Home All Axis
; =====================================================================================================================
M400                                                                           ; wait for current moves to finish
M913 X55 Y60                                                                   ; drop motor current to 55%/60%
G4 P200                                                                        ; wait 200ms

G91                                                                            ; relative positioning
G1 H2 Z5 F12000                                                                ; lift Z relative to current position
M400                                                                           ; wait for current moves to finish

G1 H2 X0.01	Y0.01                                                              ; move X, Y a small amount to enable
M400					                                                       ; wait for current moves to finish
G4 P200					                                                       ; Delay to allow TMC to detect stopped state

G1 H1 X-255 Y-255 F8000                                                        ; move quickly to X axis endstop and stop there (first pass)
G1 H2 X5 Y5 F12000                                                             ; go back a few mm
G1 H1 X-255 Y-255 F7000                                                        ; move quickly to X axis endstop and stop there (second pass)
G1 H2 Z-5 F6000                                                                ; lower Z again

G90                                                                            ; absolute positioning
G1 X30 Y40 F6000                                                               ; go to first bed probe point and home Z
G30                                                                            ; home Z by probing the bed

G91                                                                            ; relative positioning
G1 Z5 F500                                                                     ; lift Z relative to current position

M400                                                                           ; wait for current moves to finish
M913 X100 Y100                                                                 ; return X & Y motor currents to 100%
G4 P200                                                                        ; wait 200ms

G90                                                                            ; absolute positioning