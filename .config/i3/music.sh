#!/bin/bash

# Builds my standard workspace

i3-msg "workspace 10; append_layout ~/.config/i3/music.json"
kitty --session ~/.config/i3/kitty_vis &
spotify &
