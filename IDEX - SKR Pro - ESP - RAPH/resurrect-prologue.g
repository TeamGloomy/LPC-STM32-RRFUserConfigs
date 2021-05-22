; recovery script for MarX IDEX by MaracMB
T R1
M116 			; wait for temperatures
G28 X U Y 		; home all but Z
G1 Y155 		; move bed to Z homing safe position
G28 Z 			; Z homing
M83 			; relative extrusion
G1 E4 F3600 	; undo the retraction that was done in the M911 power fail script