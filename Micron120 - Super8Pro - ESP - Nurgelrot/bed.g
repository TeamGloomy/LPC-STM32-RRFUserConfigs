M561
M558 K0 H8 F500 ;1000
G90
G1 Z12 ;F2000
M401

G30 K0 P0 X15 Y30 Z-99999
G30 K0 P1 X15 Y100 Z-99999
G30 K0 P2 X105 Y100 Z-99999
G30 K0 P3 X105 Y30 Z-99999 S4
echo "Current rough pass deviation: " ^ move.calibration.initial.deviation

M558 K0 H4 F300 ;500

G30 K0 P0 X15 Y30 Z-99999
G30 K0 P1 X15 Y100 Z-99999
G30 K0 P2 X105 Y100 Z-99999
G30 K0 P3 X105 Y30 Z-99999 S4
echo "Current medium pass deviation: " ^ move.calibration.initial.deviation

M558 K0 H2 F120
while move.calibration.initial.deviation > 0.005
	if iterations >= 5
		echo "Error: Max attemps failed. Deviation: " ^ move.calibration.initial.deviation
		break
	echo "Deviation over threshold. Executing pass" , iterations+3, "deviation", move.calibration.initial.deviation
	G30 K0 P0 X15 Y30 Z-99999
	G30 K0 P1 X15 Y100 Z-99999
	G30 K0 P2 X105 Y100 Z-99999
	G30 K0 P3 X105 Y30 Z-99999 S4
	echo "Current deviation: " ^ move.calibration.initial.deviation
	continue
echo "Final deviation: " ^ move.calibration.initial.deviation
M558 K0 F600:180
G28 Z

