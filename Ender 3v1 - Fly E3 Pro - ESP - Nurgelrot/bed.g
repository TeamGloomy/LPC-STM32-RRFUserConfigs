; bed.g
; called to perform automatic bed compensation via G32
;

M561 							; Clear any bed transform
G29 S2							; Clear bed height map
M671 X-26:366 Y118:118 S3		; Set phisical location of the lead screw in reation to the bed coords
G28								; home all

; Probe 2-point
; loop unless probe points are within 0.009 or 5 loops is reached
while true						; run leveling pass
	G30 P0 X27 Y118 Z-9999 		; Front Left
	G30 P1 X197 Y118 Z-9999 S2	; Front Right
	if move.calibration.initial.deviation < 0.009
		break "Completed"
		; check pass limit - abort if pass limit reached
		if iterations = 5
			M291 P"Bed Leveling Aborted" R"Pass Limit Reached"
			abort "Bed Leveling Aborted - Pass Limit Reached"
 