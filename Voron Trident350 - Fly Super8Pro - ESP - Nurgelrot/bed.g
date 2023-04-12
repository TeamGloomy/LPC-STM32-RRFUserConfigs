M290 R0 S0                                          ;  clear baby stepping
M561                                                ; clear any bed transform
M400                                                ;  flush move queue

if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  echo "not all axes homed, homing axes first"
  G28

G30 P0 X15 Y15 Z-99999                              ; probe near a leadscrew
G30 P1 X175 Y335 Z-99999                            ; probe near a leadscrew
G30 P2 X335 Y15 Z-99999 S3                          ; probe near a leadscrew and calibrate 3 motors
echo "Current rough pass deviation: " ^ move.calibration.initial.deviation

M558 H2 F120
while move.calibration.initial.deviation > 0.005
        if iterations >= 5
			echo "Error: Max attemps failed. Deviation: " ^ move.calibration.initial.deviation
			break
        echo "Deviation over threshold. Executing pass" , iterations+1, "deviation", move.calibration.initial.deviation
        G30 P0 X15 Y15 Z-99999                      ; probe near a leadscrew
		G30 P1 X175 Y335 Z-99999                    ; probe near a leadscrew
		G30 P2 X335 Y15 Z-99999 S3                  ; probe near a leadscrew and calibrate 3 motors
        echo "Current deviation: " ^ move.calibration.initial.deviation
        continue
echo "Final deviation: " ^ move.calibration.initial.deviation
G1 X175 Y175 Z10 F18000

                                                    ; Reset probe dive height and speed
M558 H5 F600:120 

                                                    ; rehome Z as the absolute height of the z plane may have shifted
G28 Z
