; homex.g
; called to home the X axis
;M913 X80 				; Lower X
;M915 P0 S20 H200 R0 	; Set stall detect
;M574 X1 S3				; Configure Stall Detect
;G1 H2 Z5				; lift Z relative to current position
;g1 H1 X5				; back away from endstop
;M400					; wait complete
;G1 X-220 H1 			; Move to Home
;G1 X1 					; Move away from stop and clear stall
;G1 H2 Z-5				; Return Z to original position
;M400 					; wait complete
;G90 					; Absolute positioning
;M913 X100 	 			; back to full power

M400 					; Wait for motion to stop
G91 					; Use relative moves
G1 H2 X0.01 Z0.01 		; Move X a small amount to enable
M400 					; Wait for stop
G4 P200 				; Delay to allow TMC to detect stopped state
M913 X80 	 			; Lower X power
G4 P200 				; Delay to ensure settings are made
G1 H2 Z5 	 			; lift Z relative to current position
M915 p0 s20 H200 r0 	; Configure stall detect
M574 X1 S3              ; Configure X endstop
g1 H1 X-260 F2500 		; back away from endstop
M400					; Wait for stop
M915 p0 s30 H200 r0 	; Configure stall detect
G4 P200					; Delay
g1 H1 X10 F2500 		; back away from endstop
M400					; wait for stop
G1 H1 X-260 F3000 		; Move towards endstop until it stalls
M400 					; Wait until all stopped
G1 X1 F1000 			; Move away from stop and clear stall
G1 H2 Z-5 F2500 		; Return Z to original position
M400 					; wait complete
G90 					; Absolute positioning
M913 X100 				; back to full power

