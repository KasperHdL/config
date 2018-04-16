#!/bin/bash

declare -i VALUE=$(sed -n 1p /sys/class/backlight/intel_backlight/brightness)
declare -i MAX_VALUE=$(sed -n 1p /sys/class/backlight/intel_backlight/max_brightness)
MIN_VALUE=0

declare -i Arg=$1
let "VALUE=$VALUE + $Arg"
if [ "$VALUE" -gt "$MAX_VALUE" ]
then
	let VALUE=$MAX_VALUE
elif [ "$VALUE" -lt "$MIN_VALUE" ]
then
	let VALUE=$MIN_VALUE
fi

tee /sys/class/backlight/intel_backlight/brightness <<< "$VALUE"
