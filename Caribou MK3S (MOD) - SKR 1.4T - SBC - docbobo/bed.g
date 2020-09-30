; =====================================================================================================================
; Bed Leveling
; Thanks to @jay_s_uk for sharing.
; =====================================================================================================================
if !move.axes[0].homed || !move.axes[1].homed                                  ; If the printer hasn't been homed, home it
  G28 XY                                                                       ; home y and x

M98 P"0:/sys/homez.g"                                                          ; home z

M561                                                                           ; clear any bed transform
M98 P"bed_twoscrews.g"                                                         ; perform bed tramming
echo "Bed Traming Cycle: 1 - Difference was " ^ move.calibration.initial.deviation ^ "mm"

while move.calibration.initial.deviation >= 0.005                              ; perform additional tramming if previous deviation was over 0.01mm
  if iterations = 5
    abort "Too many auto tramming attempts"

  M98 P"bed_twoscrews.g"                                                       ; perform bed tramming
  echo "Bed Traming Cycle: " ^ iterations + 2 ^ " - Difference was " ^ move.calibration.initial.deviation ^ "mm"
  continue

G28 Z                                                                          ; home z