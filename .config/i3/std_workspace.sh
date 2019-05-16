#!/bin/bash

# Builds my standard workspace

i3-msg "append_layout ~/.config/i3/std_workspace.json"
surf todoist.com &
qutebrowser &
kitty
