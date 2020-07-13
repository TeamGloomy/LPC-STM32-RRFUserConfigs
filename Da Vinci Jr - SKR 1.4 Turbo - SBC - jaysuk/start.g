M140 S65													; Set heated bed to 65 and release
T0															; Select Tool 0
M291 P"Print Started. Preheating and Homing." T10			; On screen notification
G4 S1
M220 S100													; Set speed factor back to 100% in case it was changed
M221 S100													; Set extrusion factor back to 100% in case it was changed
M290 R0 S0													; Clear babystepping
M106 S0														; Turn part cooling blower off if it is on
G10 P0 R0 S80												; Set extruder to 80 and release
M190 S60													; Set heated bed to 60 and wait
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28
G29 S1														; Load heightmap
M400
G10 P0 R80 S180												; Set extruder to 180 and release
 
; Slicer Start Gcode begins.