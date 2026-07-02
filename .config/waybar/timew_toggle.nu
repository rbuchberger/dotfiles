#!/usr/bin/env nu

if (timew get dom.active) == "1" {
    timew stop
} else {
    timew continue
}

pkill -42 waybar
