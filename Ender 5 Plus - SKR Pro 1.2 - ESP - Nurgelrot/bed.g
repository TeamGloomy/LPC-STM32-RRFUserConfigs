; bed.g
; called to perform automatic bed compensation via G32
;
; Bed file for Ender 5 Plus with probe offset of -45 -7 (creality default)
M561 ; clear any bed transform
G29 S2; Clear bed height map
; Probe 3-point
M401 ; Deploy probe - deployprobe.g
G30 P0 X47 Y187 Z-9999 ; Front Left
G30 P1 X315 Y187 Z-9999 S2; Front Right
M402 ; Retract Probe - retractprobe.g

