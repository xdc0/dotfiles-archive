#!/usr/bin/env bash

function Battery() {
    # BATTERY
    local BATTERY=$(acpi | sed 's/[,%]//g' | awk '{print $3 " " $4}')
    local BATTERY_STATUS=$(echo $BATTERY | cut -f 1 -d " ")
    local BATTERY_PERCENTAGE=$(echo $BATTERY | cut -f 2 -d " ")
    local LABEL="BAT"
    if [ $BATTERY_PERCENTAGE -gt 70 ]; then
        local COLOR="^fg(green)"
    elif [ $BATTERY_PERCENTAGE -gt 35 ]; then
        local COLOR="^fg(orange)"
    else
        local COLOR="^fg(red)"
    fi

    if [ $BATTERY_STATUS == "Charging" ]; then
        local LABEL="CHR"
        local COLOR="^fg(green)"
    fi

    echo "$LABEL $COLOR$BATTERY_PERCENTAGE%^fg()"
}

function Date() {
    echo $(date +"%Y-%m-%d - %R")
}

function mpc_status() {
    if mpc -q; then
        local MPC_STATUS=$(mpc status | grep "\[playing\|paused\]" | sed -n 's/^\[\([a-z]*\)\].*/\1/p')

        if [[ $MPC_STATUS = "playing" ]]; then
            local LABEL="mpc playing"
        elif [[ $MPC_STATUS = "paused" ]]; then
            local LABEL="mpc paused"
        else
            local LABEL="mpc stopped"
        fi
        local MPC_CURRENT_SONG=$(mpc -f "%title%" current)
        local SIZE=${#MPC_CURRENT_SONG}

        if [ ${#MPC_CURRENT_SONG} -gt 80 ]; then
            MPC_CURRENT_SONG=$(echo $MPC_CURRENT_SONG | cut -c -80)
            MPC_CURRENT_SONG="$MPC_CURRENT_SONG..."
        fi
    else
        local LABEL="mpc"
        local MPC_CURRENT_SONG="mpd not running"
    fi

    echo "$LABEL - $MPC_CURRENT_SONG"
}

function cpu_temp_usage() {
    local TEMP=$(sensors | grep Physical | awk '{print $4}' | cut -c 2-)
    local USAGE=$(awk '{print $1 * 100}' /proc/loadavg)
    echo "CPU $USAGE% $TEMP"
}

# MAIN FUNCTION
function Status() {
    BATTERY=$(Battery)
    DATE=$(Date)
    MPC=$(mpc_status)
    CPU=$(cpu_temp_usage)

    echo "$MPC | $CPU | $BATTERY | $DATE"
}

# LOOP

while true; do echo $(Status) > /tmp/xmonad.status; sleep 1; done;
