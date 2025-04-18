def bootstrap [] {

}

def wwatch [
  # Command to run
  command: closure
  # Refresh interval
  --interval (-n): duration = 10sec
  --no-clear (-c)
] {
  loop {
    if not $no_clear { clear }
    print (do $command)
    sleep $interval
  }
}
