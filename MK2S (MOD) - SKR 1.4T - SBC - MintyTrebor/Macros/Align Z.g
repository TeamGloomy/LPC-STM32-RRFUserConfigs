
;****************COPIED FROM HOME Z SCRIPT**********************
G91                 ; relative positioning
G1 H2 Z10 F1200     ; lift Z relative to current position
G90                 ; absolute positioning
G1 X140 Y145 F5000 	; Move to Middle of Bed
M558 F650 			; Set the probing speed
G30					; Probe a single point
M400				;
G4 P200 			;
M558 F300 			; Set a slower probing speed
G4 P200 			;
G30	                ; Probe a single point
G91                 ; relative positioning
G1 Z5 F1200         ; lift Z relative to current position
G90                 ; absolute positioning
;G1 X0 Y0 F5000		; Move to Left Corner
;*************** END *********************************************
M400					; Finish Moves
M208 Z0:215 			; Set Max Height Higher than 200
G90						; Set Absolute Positioning
G1 X120					; Move X to Middle
M400					; Finish Moves
G1 Z215					; Raise Z to 210
M400					; Finish Moves
G1 Z100					; Move Z back down
M400					; Finish Moves
M208 Z0:200 			; Set Max Height back to 200
G90                 	; absolute positioning
;****************COPIED FROM HOME Z SCRIPT**********************
G91                 ; relative positioning
G1 H2 Z10 F1200     ; lift Z relative to current position
G90                 ; absolute positioning
G1 X140 Y145 F5000 	; Move to Middle of Bed
M558 F650 			; Set the probing speed
G30					; Probe a single point
M400				;
G4 P200 			;
M558 F300 			; Set a slower probing speed
G4 P200 			;
G30	                ; Probe a single point
G91                 ; relative positioning
G1 Z5 F1200         ; lift Z relative to current position
G90                 ; absolute positioning
G1 X0 Y0 F5000		; Move to Left Corner
;*************** END *********************************************