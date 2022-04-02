#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    BATTERY="BAT0"
    CHARGE=$(cat /sys/class/power_supply/${BATTERY}/capacity)
    STATUS=$(cat /sys/class/power_supply/${BATTERY}/status)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Charging" ] || [ "$STATUS" = "Full" ]; then
            printf "🔌 "
        else
            printf "🔋 "
        fi
	printf "%s%%" "$CHARGE"
    else
        printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery

