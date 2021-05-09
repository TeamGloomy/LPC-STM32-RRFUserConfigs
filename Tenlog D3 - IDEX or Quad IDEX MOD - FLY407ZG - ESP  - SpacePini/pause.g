; pause.g
; called when a print from SD card is paused
;
; scripted by Pini
;
M83 			; relative extrusion
G91 			; relative movement
G1 E-2 F3600 		; retract 2mm
G1 Z2 F500 		; raise 2mm
G90 			; absolute movement
G28 X U
;G1 H2 X-188 U188 F6000 ; park both heads

