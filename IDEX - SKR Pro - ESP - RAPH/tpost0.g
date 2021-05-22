M106 R2         	; restore print cooling fan speed
M116 P0 		; wait for tool 0 heaters to reach operating temperature
G28 X
G1 E12 F600 		; extrude 12mm - repriming
;
G1 X-192 F12000    ; brush
G1 X-172 F12000
G1 X-192 F12000
G1 X-172 F12000
G1 X-192 F12000

; rather use M98 Pscriptname.g and create a macro for brush cleaning...

