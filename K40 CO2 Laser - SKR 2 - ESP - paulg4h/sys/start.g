if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed           ; If the printer hasn't been homed, home it
  M98 P"0:/sys/homeall.g"                                                      ; home all

if sensors.gpIn[0].value = 1                                                   ; check if lid is open, if yes stop job!
    M0
	M118 S"close lid first to start job!"
else
    M7			; Run m7.g