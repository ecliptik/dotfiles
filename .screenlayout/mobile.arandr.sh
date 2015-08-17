#!/bin/sh
xrandr --output LVDS1 --off --output HDMI2 --off --output VGA1 --off
xrandr --output LVDS1 --auto --primary
