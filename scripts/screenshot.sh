#!/bin/bash

#
## Delayed screenshot
#

# Requires slurp, grim, mako and Sway

# First function, requires time as input
countdown () {
	notify-send "Screenshot soon" "Screenshot in $1" -u low -t 1100 -i ~/.config/mako/monitor-screenshot.png
}

DELAY="$1"		# Takes first argument as delay in seconds
if [[ ! $DELAY =~ ^[1-9][0-9]*$ ]]; then
	echo "Please input a valid integer"
	exit 1
fi

DIMENSIONS="$(slurp)"		# Records region

# Countdown
for (( i=DELAY; i>0; i--))
do
	countdown "$i"
	sleep 1
	makoctl dismiss -a
done
sleep 0.1
# Executes screenshot
grim -g "$DIMENSIONS" -| wl-copy
# Notifies user
sleep 0.1
notify-send "Screenshot done" "Screenshot taken" -u low -i ~/.config/mako/monitor-screenshot.png
exit 0
