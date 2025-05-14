#!/bin/sh
if pgrep  gammastep >/dev/null; then 
    printf '{"text":"󱩌","class":"enabled"}'; 
else
    printf '{"text":"󱩌"}';
fi