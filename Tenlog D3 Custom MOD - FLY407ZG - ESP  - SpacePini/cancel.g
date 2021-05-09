; stop.g
; called when a print is cancelled after a pause.

M104 S0 T0 		; cool 1st head
M104 S0 T1 		; cool 2nd head
M106 S0 P2 X1 		; disable left fan power and optionally set limits
M106 S0 P3 X1 		; disable right fan power and optionally set limits