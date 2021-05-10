; homez.g
; called to home the Z axis
; scripted by Pini

G91               		        ; relative positioning
G1 H1 Z-355 F300
G1 Z4 F300				; lift both Zs for 3mm
G1 H1 Z-6 F100
G1 Z2 F200				; lift both Zs for 2
G90					; absolute positioning