; tfree0.g
; called when tool 0 is freed
;
; scripted by Marac
;
;M83 				; relative extruder movement
;G1 E-2 F3600 			; retract 2mm
G91 				; relative axis movement
G1 Z2 F500 			; up 2mm
G90 				; absolute axis movement
G1 H2 X-186 F9000 		; move the X carriage out of the way FAST 2mm before minimum
G28 X				; park the X carriage home
;M106 S0         		; turn off print cooling fan