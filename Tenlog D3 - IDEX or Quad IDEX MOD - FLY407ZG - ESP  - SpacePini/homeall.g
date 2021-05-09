; homeall.g
; called to home all axes
;
; scripted by Pini


G91                     	; relative positioning
G1 Z5 F4000 H2           	; lift Z relative to current position
G1 X-400 Y-350 U400 F2200 H1	; move quickly to X and Y axis endstops and stop there (first pass)
G1 X5 Y5 U-5 F400          	; go back a 5 mm
G1 X-10 Y-10 U10 F360 H1 	; move slowly to X, U and Y axis endstops once more (second pass)
M98 Phomez.g			; call homing script for Z axes
M300 S2210 P50


