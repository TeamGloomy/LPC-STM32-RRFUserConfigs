; tfree3.g
; called when tool 3 is freed
;
; scripted by Marac
;
;M83 				; relative extruder movement
G91 				; relative axis movement
G1 Z2 F500 			; up 2mm
G90 				; absolute axis movement
G1 H2 U186 F9000 		; move the U carriage out of way FAST 2mm before home
G28 U				; park the U carriage home - slow
M106 S0         		; turn off our print cooling fan