# ICONS HOME
ICONS_HOME="/home/xdc/.xmonad/icons"

function Battery() {
    # BATTERY
    local BATTERY=$(acpi | sed 's/[,%]//g' | awk '{print $3 " " $4}')
    local BATTERY_STATUS=$(echo $BATTERY | cut -f 1 -d " ")
    local BATTERY_PERCENTAGE=$(echo $BATTERY | cut -f 2 -d " ")
    if [ $BATTERY_PERCENTAGE -gt 70 ]; then
        local COLOR="^fg(green)"
        local ICON="^i($ICONS_HOME/bat_full_01.xbm)"
    elif [ $BATTERY_PERCENTAGE -gt 35 ]; then
        local COLOR="^fg(orange)"
        local ICON="^i($ICONS_HOME/bat_low_01.xbm)"
    else
        local COLOR="^fg(red)"
        local ICON="^i($ICONS_HOME/bat_empty_01.xbm)"
    fi

    if [ $BATTERY_STATUS == "Charging" ]; then
        local COLOR="^fg(green)"
    fi

    echo "$COLOR $ICON ^fg()$BATTERY_PERCENTAGE%"
}

function Date() {
    echo $(date +"%Y-%m-%d - %R")
}

# MAIN FUNCTION
function Status() {
    BATTERY=$(Battery)
    DATE=$(Date)

    echo "$BATTERY $DATE"
}

# LOOP

while true; do echo $(Status) > /tmp/xmonad.status; sleep 1; done;
