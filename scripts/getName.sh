#!/bin/bash

FOCUSED_NODE=$(swaymsg -t get_tree | jq -r '..|try select(.focused == true)')
SHELL=$(echo "$FOCUSED_NODE" | jq -r '.shell')
if [ "$SHELL" == "xwayland" ]; then
	CLASS=$(echo "$FOCUSED_NODE" | jq -r '.window_properties.class')
	STR="Uses XWayland\n\n"
	STR+="class:\t"
	STR+="$CLASS"
else
	#WAYLAND="wayland"
	#echo "Uses native Wayland"
	APP_ID=$(echo "$FOCUSED_NODE" | jq -r '.app_id')
	#echo -n "app_id: "
	#echo "$APP_ID"
	STR="Uses native Wayland\n\n"
	STR+="app_id:\t"
	STR+="$APP_ID"
fi
STR+="\n"
TITLE=$(echo "$FOCUSED_NODE" | jq -r '.name')
STR+="title:\t"
STR+="$TITLE"
STR+="\n"
printf "$STR"
notify-send "Window info" "$STR" 
