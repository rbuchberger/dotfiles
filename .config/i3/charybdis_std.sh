#!/bin/bash

# Builds my standard workspace (updated for taskwarrior)


kitty --class 'taskmon' --session ~/.config/i3/kitty_taskmon &
kitty &
kitty &
qutebrowser &

i3-msg "append_layout ~/.config/i3/charybdis_std.json"
