#!/bin/sh
#
# Fetch status information

main() {
    date=$(date +'%a, %d.%m.%Y %H:%M')
    test -d /sys/class/power_supply/BAT0 && bat=$(~/.local/bin/batterystate.sh)
    printf "${bat} ${date}\n"
}

main
