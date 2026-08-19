#!/bin/sh
#
# Fetch status information

main() {
    uptime="$(uptime --pretty) | "
    disk="Disk: $(df --human-readable / --output=pcent | sed 1d | cut --whitespace-delimited --fields=2) | "
    ram="RAM: $(free --human --line | cut --whitespace-delimited --fields=4) | "
    date="$(date +'%a, %d.%m.%Y %H:%M') "
    test -d /sys/class/power_supply/CMB1 && bat="Bat: $(~/.local/bin/batterystate.sh) | "
    printf "%s\n" "${uptime}${disk}${ram}${bat}${date}"
}

main
