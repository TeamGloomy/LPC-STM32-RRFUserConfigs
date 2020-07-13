; homex.g
; called to home the X axis
;
M400					; Wait for motion to stop
G91						; Use relative moves
G1 H2 X0.01	Y0.01 Z0.01	; Move X a small amount to enable
M400					; Wait for stop
G4 P200					; Delay to allow TMC to detect stopped state
M915 p0 s40 H200 r0		; Configure stall detect
M574 X1 S3				; Configure X endstop
M913 X50 Y50 			; Lower X, Y and Z power
G4 P200					; Delay to ensure settings are made
G1 H2 Z5 F2500			; lift Z relative to current position
g1 H1 X20 F2000			; back away from endstop
M400					; Wait for stop
M915 p0 s40 H200 r0		; Configure stall detect
G4 P200					; Delay to ensure settings are made
G1 H1 X-325 F2500		; Move towards endstop until it stalls
M400					; Wait until all stopped
M915 p0 s40 H200 r0		; Configure stall detect
G4 P200					; Delay to ensure settings are made
g1 H1 X10 F2000			; back away from endstop
M400
M915 p0 s40 H200 r0  	; Configure stall detect
G4 P200
G1 H1 X-325 F2500		; Move towards endstop until it stalls
M915 p0 s40 H200 r0		; Configure stall detect to be less sensitive
M400
G1 X1 F1000				; Move away from stop and cancel stall
M400					; wait complete
G1 H2 Z-5 F2500			; Return Z to original position
G90						; Absolute positioning
M913 X100 Y100 			; back to full power
M915 P1 S20 H200 R1		; Report any stalls