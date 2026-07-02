#!/usr/bin/env nu

(timew | complete | get exit_code) == 0 | let is_tracking

if $is_tracking {
    timew stop
} else {
    timew continue
}

try { ^pkill -42 waybar } catch {}
