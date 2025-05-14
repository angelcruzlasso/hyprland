#!/bin/bash
if pgrep gammastep >/dev/null; then 
    sleep 1 
    pkill gammastep
    notify-send -t 1000 "gammastep Stoped"
else
    sleep 1
    gammastep -O 4500 &
    notify-send -t 1000 "gammastep ON"
fi