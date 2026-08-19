#!/bin/sh
#
# Check the battery status; provide its battery name (e.g. BAT0)

main() {
    test ! -d /sys/class/power_supply/${1} && exit 1
    read bat_perc < /sys/class/power_supply/${1}/capacity
    read bat_status < /sys/class/power_supply/${1}/status
    # Send warning if battery is low and no charger is plugged in
    test "${bat_perc}" -le 5 && test "${bat_status}" != 'Charging' \
        && notify-send --urgency=ciritcal "Plug in a charger, low battery!"
    printf "%s\n" "${bat_perc}% (${bat_status})"
}

main $1
