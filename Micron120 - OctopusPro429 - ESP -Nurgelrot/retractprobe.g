if sensors.probes[0].value[0] == 0
  M564 H1
  G90
  G1 X20 Y100 F3000
  G1 Y123
  G1 X57
  M400
  if sensors.probes[0].value[0] == 0
    abort "Probe detach failed"
G1 X57 Y61