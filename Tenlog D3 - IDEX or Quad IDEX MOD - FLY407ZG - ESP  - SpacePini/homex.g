; homex.g
; called to home the X axis
;
G91              	; relative positioning
G1 H2 Z2 F600    	; lift Z relative to current position
G1 H1 X-320 F900 	; move quickly to endstop and stop there
G1 X4 F600 		; go back a few mm
G1 H1 X-6 F360 	 	; move slowly to axis endstop once more
G1 X2 F360			; backout
G1 Z-2 F300 H2   	; lower Z again
G90               	; absolute positioning