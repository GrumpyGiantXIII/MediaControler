#!/bin/sh
sudo mkdir /mnt/VLCMediaController
sudo mkdir /mnt/VLCMediaController/LaunchScripts

sudo cp Shell/LaunchScripts/* /mnt/VLCMediaController/LaunchScripts
sudo chmod 0755 /mnt/VLCMediaController/LaunchScripts/*

sudo cp Shell/Services/MediaServer_StartStopService.service /etc/systemd/system/MediaServer_StartStopService.service
sudo cp Shell/Services/SoundPannelServer_StartStopService.service /etc/systemd/system/SoundPannelServer_StartStopService.service
sudo systemctl enable MediaServer_StartStopService.service 
sudo systemctl enable SoundPannelServer_StartStopService.service
sudo systemctl daemon-reload
