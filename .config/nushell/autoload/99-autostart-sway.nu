if ($env | get --ignore-errors DISPLAY | describe) == nothing and (tty) == /dev/tty1 {
  sway | save ~/.local/state/sway.log
  exit
}
