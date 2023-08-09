#!/bin/bash
swayidle -w \
	timeout 300 ' swaylock ' \
	timeout 400 ' hyprctl dispatch dpms off' \
	timeout 1200 'systemctl suspend' \
	resume ' hyprctl dispatch dpms on' \
	before-sleep 'swaylock'
