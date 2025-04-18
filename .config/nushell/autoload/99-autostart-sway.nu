if ($env | get --ignore-errors DISPLAY | describe) == nothing and (tty) == /dev/tty1 {
  sway
  exit
}
