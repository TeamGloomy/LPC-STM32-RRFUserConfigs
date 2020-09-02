; homeall.g
; called to home all axes

M98 P"homex.g"			; home x
M400 					; Wait for stop
G4 P200 				; Delay to allow TMC to detect stopped state
M98 P"homey.g"			; home y
M400 					; Wait for stop
G4 P200 				; Delay to allow TMC to detect stopped state
M98 P"homez.g"			; home z


