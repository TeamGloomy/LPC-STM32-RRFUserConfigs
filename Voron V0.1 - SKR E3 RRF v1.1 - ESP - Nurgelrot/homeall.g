; homeall.g
; called to home all axes
;
; generated by RepRapFirmware Configuration Tool v3.3.1-LPC-STM32+5 on Sun Jan 23 2022 17:05:36 GMT-0700 (Mountain Standard Time)
G91                   ; relative positioning
G1 H2 Z5 F7000        ; lift Z relative to current position
G1 H1 X125 Y125 F1800 ; move quickly to X or Y endstop and stop there (first pass)
G1 H1 X125            ; home X axis
G1 H1 Y125            ; home Y axis
G1 X-5 Y-5 F7000      ; go back a few mm
G1 H1 X125 F360       ; move slowly to X axis endstop once more (second pass)
G1 H1 Y125            ; then move slowly to Y axis endstop
G90				      ; abs pos
G1 X57 Y57 F7000      ; Go to middle of bed.
G91				      ; rel pos
G1 H1 Z-125 F1800     ; move Z down until the endstop is triggered
G1 Z5 F3000			  ; move back
G1 H1 Z-125 F360      ; move Z down stopping at the endstop
G90                   ; absolute positioning
G92 Z0                ; set Z position to axis minimum (you may want to adjust this)

; Uncomment the following lines to lift Z after probing
G91                  ; relative positioning
G1 Z5 F100           ; lift Z relative to current position
G90                  ; absolute positioning

