; homeall.g
; called to home all axes

; generated by RepRapFirmware Configuration Tool v3.2.1-LPC+11 on Wed May 12 2021 15:02:58 GMT-0600 (Mountain Daylight Time)
G91                   ; relative positioning
G1 H2 Z5 F8000        ; lift Z relative to current position
G1 H1 X365 Y365 F1800 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X-5 Y-5 F6000   ; go back a few mm
G1 H1 X365 Y365 F360  ; move slowly to X and Y axis endstops once more (second pass)
G90                   ; absolute positioning
G1 X225 Y187 F8000    ; move probe to ceter of bed and home Z
G30                   ; home Z by probing the bed
G1 X180 Y180 F6000    ; Move nozel to center cuz I'm anal

; Uncomment the following lines to lift Z after probing
;G91                  ; relative positioning
;G1 Z5 F100           ; lift Z relative to current position
;G90                  ; absolute positioning


