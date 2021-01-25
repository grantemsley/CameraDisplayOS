#!/bin/bash

if [ -z "$2" ];
then
	/usr/bin/omxplayer --win "$1" --loop -I -z --no-keys ~/notconfigured.mp4
elif [ "$2" == "NONE" ];
then
	/usr/bin/omxplayer --win "$1" --loop -I -z --no-keys ~/blank.mp4
else
	/usr/bin/omxplayer --win "$1" --live -I -z --no-keys $2
fi
