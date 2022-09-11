M18 z
M17 Z
G4 P150

G91              ; relative positioning
G1 H2 Z8 F6000   ; lift Z relative to current position
G90              ; absolute positioning
M401
G1 X57 Y30 F6000 ; go to first probe point
G30 K0 Z-99999              ; home Z by probing the bed
M402

; Uncomment the following lines to lift Z after probing
G91             ; relative positioning
G1 Z5 F100      ; lift Z relative to current position
G90             ; absolute positioning

