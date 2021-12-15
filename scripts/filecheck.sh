#!/bin/bash
val=$(</srv/http/chasar.se/counter.txt)
while [ 1 == 1 ]
do
    newval=$(< /srv/http/chasar.se/counter.txt)
    if [ $newval -gt $val ]
    then
        xdotool key Up
        echo Previous 
        let val++
    elif [ $newval -lt $val ]
    then
        let val--
        echo Next
        xdotool key Down
    fi
    sleep 0.2
done