#!/usr/bin/env bash
export DISPLAY=:0
MAIL=$(/usr/bin/fetchmail -c | /bin/sed 's/(//' | /usr/bin/awk '{print $1 - $3}')

if [ $MAIL -gt 0 ]; then
    /usr/bin/notify-send "$MAIL new mails"
    fetchmail
fi
