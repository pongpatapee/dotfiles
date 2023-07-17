#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar-main.log
for m in $(polybar --list-monitors | cut -d":" -f1); do
	# polybar main -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar-main.log &
	MONITOR=$m polybar --reload main -c ~/.config/polybar/config.ini 2>&1
	# MONITOR=$m polybar --reload main &
done

disown

echo "Bars launched..."
