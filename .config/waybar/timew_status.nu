#!/usr/bin/env nu

let state = if (timew get dom.active) == "1" {
  { icon: "⏵", class: "tracking" }
} else {
  { icon: "⏹", class: "idle" }
}

# I can't find an easier way to get this output from timewarrior.
let total = timew summary :quiet
  | lines
  | where { is-not-empty }
  | last
  | default "0:00:00"
  | str trim

{
  text: $"⏱ ($state.icon) ($total)",
  tooltip: (timew summary),
  class: $state.class
} | to json --raw
