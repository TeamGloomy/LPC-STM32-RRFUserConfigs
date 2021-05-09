; homey.g
; called to home the Y axis
;
; Scripted by Pini

G91               ; relative positioning
G1 Z5 F6000 H2    ; lift Z relative to current position
G1 H1 Y-310 F1800 ; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F6000       ; go back a few mm
G1 H1 Y-310 F360  ; move slowly to Y axis endstop once more (second pass)
G1 Z-5 F6000 H2   ; lower Z again
G90               ; absolute positioning

