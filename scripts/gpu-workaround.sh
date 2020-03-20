#! /bin/bash
# Changes power settings of the gpu, as a workaround to the freezes I've been
# getting.

case $1 in
  "on")
    echo manual > /sys/class/drm/card0/device/power_dpm_force_performance_level
    echo 7 > /sys/class/drm/card0/device/pp_dpm_sclk
    ;;
  "off")
    echo auto > /sys/class/drm/card0/device/power_dpm_force_performance_level
    ;;
  *)
    echo "First argument should be 'on' or 'off'."
    echo 'Current Status: '
    cat /sys/class/drm/card0/device/power_dpm_force_performance_level
esac
