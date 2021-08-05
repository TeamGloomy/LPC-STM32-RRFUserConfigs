while true
  ; G4 S10
  if job.duration = null
      ; No job ignore sensor reading
  else
      ; Check Water Flow
      if fans[0].rpm < 100
          ; NO FLOW
          M25
          M117 "No Water flow!" 
          M118 S"No Water flow!" L1
          M118 P3 S"No Water flow!" L1
      ; Check water temperature
      if sensors.analog[0].lastReading > 35
         M25
         M117 "Water to hot!"
         M118 S"Water to hot!" L1
         M118 P3 S"Water to hot!" L1
