; homez.g
; called to home the Z axis
;
; generated by RepRapFirmware Configuration Tool v3.2.1-LPC+11 on Wed May 12 2021 15:02:58 GMT-0600 (Mountain Daylight Time)
G91              ; relative positioning
G1 H2 Z5 F8000   ; lift Z relative to current position
G90              ; absolute positioning
G1 X225 Y187 F8000 ; go to first probe point
G30              ; home Z by probing the bed

; Uncomment the following lines to lift Z after probing
;G91             ; relative positioning
;G1 Z5 F100      ; lift Z relative to current position
;G90             ; absolute positioning

