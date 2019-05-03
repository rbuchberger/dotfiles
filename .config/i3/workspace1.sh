#!/bin/bash

# Builds my standard workspace

i3-msg "workspace 1; append_layout ~/.config/i3/workspace1.json"
firefox todoist.com &
firefox fastmail.com &
kitty
