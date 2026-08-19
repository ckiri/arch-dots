#!/bin/sh
#
# Check the battery status


main() {
    bat_name=$(ls --format=single-column /sys/class/power_supply/ | grep -E '\b[A-Z]{2,3}[0-9]\b')
    test ! -n "$bat_name" && exit 1
    read bat_perc < /sys/class/power_supply/${bat_name}/capacity
    read bat_status < /sys/class/power_supply/${bat_name}/status
    # Send warning if battery is low and no charger is plugged in
    test "${bat_perc}" -le 5 && test "${bat_status}" != 'Charging' \
        && notify-send --urgency=ciritcal "Plug in a charger, low battery!"
    printf "%s\n" "${bat_perc}% (${bat_status})"
}

main

