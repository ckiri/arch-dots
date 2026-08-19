#!/bin/sh
#
# Fetch status information

main() {
    uptime="$(uptime --pretty) | "
    disk="Disk: $(df --human-readable / --output=pcent | sed 1d | cut --whitespace-delimited --fields=2) | "
    ram="RAM: $(free --human --line | cut --whitespace-delimited --fields=4) | "
    date="$(date +'%a, %d.%m.%Y %H:%M') "
    bat_name=$(ls --format=single-column /sys/class/power_supply/ | grep -E '\b[A-Z]{2,3}[0-9]\b')
    test -n "${bat_name}" && bat="Bat: $(~/.local/bin/batterystate.sh ${bat_name}) | "
    printf "%s\n" "${uptime}${disk}${ram}${bat}${date}"
}

main


