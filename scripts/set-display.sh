#!/bin/bash
#Set screen resolution to 1024x768 which should work on laptop and projectors

#xrandr --output HDMI1 --mode 1024x768 --output LVDS1 --mode 1024x768 --same-as HDMI1

internal="LVDS1"

#Turn off all display
turnoff() {
    xrandr --output LVDS1 --off --output HDMI1 --off --output VGA1 --output HDMI2 --off --output VGA2 --off
}

#For laptop display only
if xrandr | grep "HDMI1 disconnected" && xrandr | grep "VGA1 disconnected" ; then
    turnoff
    xrandr --output HDMI1 --off --output VGA1 --off --output ${internal} --auto
#For two external monitors
elif xrandr | grep "HDMI2 connected" && xrandr | grep "VGA1 connected" ; then
    turnoff
    xrandr --output VIRTUAL1 --auto --output LVDS1 --off --output VGA1 --mode 1680x1050 --pos 3046x0 --rotate left --output HDMI2 --mode 1680x1050 --pos 1366x0 --rotate normal --primary
#For projectors
elif xrandr | grep "HDMI1 connected" || xrandr | grep "VGA1 connected" ; then
    extdisplay=$(xrandr | egrep -e "(HDMI1|VGA1) connected" | awk '{print $1}')
    turnoff
    xrandr --output ${extdisplay} --mode 1024x768 --output ${internal} --mode 1024x768 --same-as ${extdisplay}
fi
