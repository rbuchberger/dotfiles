#!/usr/bin/env nu
# Waybar backlight module. Uses the built-in panel (sysfs + light) when there is one,
# otherwise an external monitor over DDC/CI (ddcutil). `check` fails when neither works.

def panel [] {
    glob /sys/class/backlight/* | get 0?
}

def main [] {
    let panel = panel
    let percent = if $panel != null {
        let current = open --raw $"($panel)/brightness" | into int
        let max = open --raw $"($panel)/max_brightness" | into int
        $current * 100 / $max
    } else {
        let values = ddcutil getvcp 10 --terse | split row " "
        ($values.3 | into int) * 100 / ($values.4 | into int)
    }
    {
        text: ""
        percentage: ($percent | math round)
    } | to json --raw
}

def "main up" [step: int] {
    if (panel) != null { light -A $step } else { ddcutil setvcp 10 + $step }
}

def "main down" [step: int] {
    if (panel) != null { light -U $step } else { ddcutil setvcp 10 - $step }
}

def "main set" [percent: int] {
    if (panel) != null { light -S $percent } else { ddcutil setvcp 10 $percent }
}
