if state.status = "paused"
  if sensors.gpIn[0].value = 0
    M118 S"lid closed, resume job"
    M24
  else
    M118 S"close lid to resume!"
else
  M118 S"Status: " ^ state.status"