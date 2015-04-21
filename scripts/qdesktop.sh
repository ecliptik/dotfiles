#!/bin/sh
#Setup dynamic rdesktop connection

presolution=`xrandr --query | grep "\*\+"| head -n 1 | awk {'print $1'}`

#Setup resolution
width=`echo "${presolution}" | awk -Fx {'print $1'}`
height=`echo "${presolution}" | awk -Fx {'print $2'}`
height=`expr ${height} - 20`
resolution="${width}x${height}"

#Setup rdesktop command
cmd="rdesktop -u mwaltz -d NA -D -k en-us -K -r clipboard:PRIMARYCLIPBOARD -g ${resolution} -T V7-SAN1P30096.na.qualcomm.com -z 10.53.204.116"

#Run command
$cmd
