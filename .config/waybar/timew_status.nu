#!/usr/bin/env nu

(timew | complete | get exit_code) == 0 | let is_tracking
timew summary | let summary

if $is_tracking {
  { icon: "⏵", class: "tracking" }
} else {
  { icon: "⏹", class: "idle" }
} | let state

if ($summary =~ "No filtered data") {
  "0:00:00"
} else {
  $summary | lines | where { is-not-empty } | last | str trim
} | let total

{
  text: $"⏱ ($state.icon) ($total)",
  tooltip: $summary,
  class: $state.class
} | to json --raw
