#!/bin/sh

# A dwm_bar function to read the battery level and BAT_STATUS
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    BATTERY="BAT0"
    ADAPTER="ADP0"
    BAT_CHARGE=$(cat /sys/class/power_supply/${BATTERY}/capacity)
    BAT_STATUS=$(cat /sys/class/power_supply/${BATTERY}/status)
    ADP_STATUS=$(cat /sys/class/power_supply/${ADAPTER}/online)
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$BAT_STATUS" = "Charging" ] || [ "$BAT_STATUS" = "Full" ] || [ "$ADP_STATUS" = "1" ]; then
            printf "🔌 "
        else
            printf "🔋 "
        fi
	printf "%s%%" "$BAT_CHARGE"
    else
        printf "BAT %s%% %s" "$BAT_
CHARGE" "$BAT_STATUS"
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery

