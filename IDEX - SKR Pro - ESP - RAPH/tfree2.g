G91 				; relative axis movement
G1 E-8 F600 	; retract 2mm
G1 Z2 F360 			; up 2mm
G90 				; absolute axis movement
M579 U1 				; deactivate possible IDEX mirror mode 
G1 X-155 U155 F10000 		; move the carriages to the edge fast
G28 X U				; home slow
M106 S0         		; turn off print cooling fan