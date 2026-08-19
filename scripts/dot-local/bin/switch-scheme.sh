#!/bin/sh
#
# Switch between light and dark ui

dawn_hour=7
dusk_hour=19

set_light() {
    dconf write /org/gnome/desktop/interface/color-scheme '"prefer-light"'
    kill -12 $(pgrep -x foot)
    exit 0
}

set_dark() {
    dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"'
    kill -10 $(pgrep -x foot)
    exit 0
}

toggle() {
    current_scheme=$(dconf read /org/gnome/desktop/interface/color-scheme)
    test "$current_scheme" = "'prefer-dark'" && set_light
    set_dark
    exit 1
}

auto() {
    current_hour=$(date +%H)
    test $current_hour -ge $dawn_hour && \
        test $current_hour -le $dusk_hour && set_light
    set_dark
    exit 1
}

main() {
    test "$1" = "--light" && set_light
    test "$1" = "--dark" && set_dark
    test "$1" = "--toggle" && toggle
    test "$1" = "--auto" && auto
    exit 1
}

main $1
