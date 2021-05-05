; homeall.g
; called to home all axes

G91                      ; relative positioning
G1 H1 X-225 Y-225 Z10 F1800  ; move quickly to X and Y axis endstops and stop there (first pass)
G1 X5 Y5 F6000           ; go back a few mm
G1 H1 X-225 Y-225 F360   ; move slowly to X and Y axis endstops once more (second pass)
G90                      ; absoute position
M401                     ; deploy probe
G1 X88 Y136 F3000     ; move to middle of bed plus probe offsets 
G30                      ; home z0
M402  