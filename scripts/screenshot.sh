#!/bin/bash

#
## Delayed screenshot
#

# Requires slurp, grim, mako and Sway

DISPLAY_1_WIDTH=1920
#DISPLAY_2_WIDTH=1920


# countdown function, requires time as input
countdown () {
	# Notifications depending on which display the screenshot was taken
	if [ "$LEFT" = true ]; then
		notify-send "Screenshot left" "Screenshot in $1" -u low -t 1100 -i ~/.config/mako/monitor-screenshot.png
	fi
	if [ "$RIGHT" = true ]; then
		notify-send "Screenshot right" "Screenshot in $1" -u low -t 1100 -i ~/.config/mako/monitor-screenshot.png
	fi
}


DELAY="$1"		# Takes first argument as delay in seconds
if [[ ! $DELAY =~ ^[1-9][0-9]*$ ]]; then
	echo "Please input a valid integer"
	exit 1
fi

DIMENSIONS="$(slurp)"		# Records region
# Multiple display support
X_POS=$(echo "$DIMENSIONS" | awk -F '[,x ]' '{print $1}')
#Y_POS=$(echo "$DIMENSIONS" | awk -F '[,x ]' '{print $2}')
WIDTH=$(echo "$DIMENSIONS" | awk -F '[,x ]' '{print $3}')
#HEIGHT=$(echo "$DIMENSIONS" | awk -F '[,x ]' '{print $4}')

# Gets set to depending on which display the notification should appear on
LEFT=false
RIGHT=false

if (( X_POS < DISPLAY_1_WIDTH ))
then
	LEFT=true
fi
if (( X_POS >= DISPLAY_1_WIDTH || X_POS + WIDTH >= DISPLAY_1_WIDTH ))
then
	RIGHT=true
fi
echo "$LEFT"
echo "$RIGHT"
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

# Notifications depending on which display the screenshot was taken
if [ "$LEFT" = true ]; then
	notify-send "Screenshot left" "Screenshot taken" -u low -i ~/.config/mako/monitor-screenshot.png
fi
if [ "$RIGHT" = true ]; then
	notify-send "Screenshot right" "Screenshot taken" -u low -i ~/.config/mako/monitor-screenshot.png
fi
exit 0
