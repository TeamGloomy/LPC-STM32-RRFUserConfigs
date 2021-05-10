; homeu.g
; called to home the U axis
;
; scripted by Pini

G91              ; relative positioning
G1 Z2 F300 H2    ; lift Z relative to current position
G1 H1 U320 F900 ; move quickly to X axis endstop and stop there (first pass)
G1 U-2 F600     ; go back a few mm
G1 H1 U4 F360	 ; move slowly to X axis endstop once more (second pass)
G1 Z-2 F300 H2   ; lower Z again
G90               ; absolute positioning

