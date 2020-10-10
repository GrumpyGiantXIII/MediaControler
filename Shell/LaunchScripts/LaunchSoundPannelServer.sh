#!/bin/sh
pulseaudio -D
vlc -I telnet --telnet-password SoundPannelController --telnet-port 4343 --novideo
exec $SHELL
