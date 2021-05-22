G1 E-9 F3000 			; retract 9mm
G91 				; relative axis movement
G1 Z2 F600 			; up 2mm
G90 				; absolute axis movement
G1 U165 F16000
G28 U				; park the U carriage home - slow
M106 S0         		; turn off our print cooling fan