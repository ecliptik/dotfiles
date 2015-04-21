#!/bin/bash
#Set screen resolution to 1024x768 which should work on laptop and projectors

#xrandr --output HDMI1 --mode 1024x768 --output LVDS1 --mode 1024x768 --same-as HDMI1

internal="LVDS1"

if xrandr | grep "HDMI1 connected" || xrandr | grep "VGA1 connected" ; then
    extdisplay=$(xrandr | egrep -e "(HDMI1|VGA1) connected" | awk '{print $1}')
    xrandr --output ${extdisplay} --mode 1024x768 --output ${internal} --mode 1024x768 --same-as ${extdisplay}
elif xrandr | grep "HDMI1 disconnected" && xrandr | grep "VGA1 disconnected" ; then
    xrandr --output HDMI1 --off --output VGA1 --off --output ${internal} --auto
fi
