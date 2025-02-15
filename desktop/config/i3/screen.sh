#!/bin/sh
if xrandr | grep -q "HDMI-1 connected"; then
  xrandr --output HDMI-1 --auto --output eDP-1 --off
elif xrandr | grep -q "Virtual-1"; then 
  xrandr --output Virtual-1 --mode 2048x1152
else
  xrandr --output eDP-1 --auto --output HDMI-1 --off
fi
