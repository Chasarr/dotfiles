#!/bin/sh

choice=$(fc-list -f "%{file}\n" | wofi -d -i --prompt='')
echo "$choice"
display "$choice"
