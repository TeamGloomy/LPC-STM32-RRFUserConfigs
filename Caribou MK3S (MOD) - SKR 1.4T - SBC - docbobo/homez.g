; =====================================================================================================================
; Home Z Axis
; =====================================================================================================================
G91                                                                            ; relative positioning
G1 H2 Z5 F6000                                                                 ; lift Z relative to current position

G90                                                                            ; absolute positioning
G1 X30 Y40 F6000                                                               ; go to first probe point
G30                                                                            ; home Z by probing the bed

G91                                                                            ; relative positioning
G1 Z5 F100                                                                     ; lift Z relative to current position

M400                                                                           ; wait for current moves to finish
G90                                                                            ; absolute positioning