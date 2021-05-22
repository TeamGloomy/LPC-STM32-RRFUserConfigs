M106 R2         	; restore print cooling fan speed
M116 P1 		; wait for tool 1 heaters to reach operating temperature
G28 U
G1 E12 F600 		; extrude 10mm - repriming

G1 U195 F12000
G1 U165 F12000
G1 U195 F12000
G1 U165 F12000
G1 U195 F12000
