if ($env | get --optional DISPLAY | describe) == nothing and (tty) == /dev/tty1 {
  sway
  exit
}
