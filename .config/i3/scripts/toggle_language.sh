#!/bin/bash

CURRENT_LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}')

if [ "$CURRENT_LAYOUT" == "us" ]; then
	setxkbmap th
	notify-send "Keyboard Layout" "Thai layout activated" -t 1000 # 1000 milliseconds (1 seconds) duration
else
	setxkbmap us
	notify-send "Keyboard Layout" "US layout activated" -t 1000
fi
