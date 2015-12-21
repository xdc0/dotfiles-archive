#!/usr/bin/env bash
MAIL=$(fetchmail -c | sed 's/(//' | awk '{print $1 - $3}')

if [ $MAIL -gt 0 ]; then
    notify-send "$MAIL new mails"
    fetchmail
fi