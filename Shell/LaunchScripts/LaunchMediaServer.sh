#!/bin/sh
vlc -I telnet --telnet-password MediaController --telnet-port 4242 --novideo
exec $SHELL
