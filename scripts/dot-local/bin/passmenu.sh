#!/usr/bin/bash
#
# Select a password from `pass` using wmenu (dmenu wayland) instead of dmenu.
# Mocks the standart implementation of passmenu. 

# Check if a wayland compositor is used, if not throw error
if test -n $WAYLAND_DISPLAY; then
    menu="wmenu"
else
    notify-send -u normal "No wayland compositor used" -i $symbol
    exit 1
fi

# Select all passwords in password store
password_files=$(find ~/.password-store -name '*.gpg' | cut -d "/" -f 5- | sed s/.gpg// )

# Pipe all passwords into the menu
password=$(printf '%s\n' "${password_files}" | $menu "$@")

# Exit if store is empty
test -n $password || exit

# Copy selected password into clipboard
pass show --clip $password
