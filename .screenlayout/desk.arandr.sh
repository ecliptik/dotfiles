#!/bin/sh
xrandr --output LVDS1 --off --output HDMI2 --off --output VGA1
xrandr --output VIRTUAL1 --auto --output LVDS1 --off --output VGA1 --mode 1680x1050 --pos 3046x0 --rotate left --output HDMI2 --mode 1680x1050 --pos 1366x0 --rotate normal --primary
