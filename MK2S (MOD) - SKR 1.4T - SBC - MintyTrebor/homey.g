; homey.g
; called to home the Y axis

G91						; Relative Positioning
M400 					; Wait for motion to stop
M915 p1 s20 H200 r0 	; Configure stall detect
M574 Y1 S3 				; Configure X endstop
G4 P200 				; Delay to ensure settings are made
G1 H2 Z5 	 			; lift Z relative to current position
g1 H1 Y-230 F2500 		; home
M400					; Wait for stop
M915 p1 s20 H200 r0 	; Configure stall detect
G4 P200					; Delay
G1 H1 Y20 F2500			; Move towards endstop until it stalls
M400 					; Wait until all stopped
G1 H1 Y-230  			; Move towards endstop until it stalls
M400 					; Wait until all stopped
G1 Y1 F1000 			; Move away from stop and clear stall
G1 H2 Z-5 F2500 		; Return Z to original position
M400 					; wait complete
G90 					; Absolute positioning
