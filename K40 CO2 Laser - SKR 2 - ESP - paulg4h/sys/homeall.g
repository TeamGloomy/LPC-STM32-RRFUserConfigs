; homeall.g
; called to home all axes
;

if !move.axes[0].homed ; If the printer hasn't been homed, home it
  M98 P"0:/sys/homex.g"  
  G4 P500                        ; Wait 500ms
if !move.axes[1].homed
  M98 P"0:/sys/homey.g"  
  G4 P500                        ; Wait 500ms
if !move.axes[2].homed
  M98 P"0:/sys/homez.g"  
  G4 P500                        ; Wait 500ms

G0 Z6.5
