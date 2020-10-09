#!/bin/sh
sudo mkdir /mnt/VLCMediaController
sudo mkdir /mnt/VLCMediaController/LaunchScripts

sudo cp Shell/LaunchScripts/LaunchMediaServer.sh /mnt/VLCMediaController/LaunchScripts/LaunchMediaServer.sh
sudo cp Shell/LaunchScripts/LaunchSoundPannelServer.sh /mnt/VLCMediaController/LaunchScripts/LaunchSoundControllerServer.sh
sudo chmod 0755 /mnt/VLCMediaController/LaunchScripts/LaunchMediaServer.sh
sudo chmod 0755 /mnt/VLCMediaController/LaunchScripts/LaunchSoundControllerServer.sh

sudo cp Shell/Services/MediaServer_StartStopService.service /etc/systemd/system/MediaServer_StartStopService.service
sudo cp Shell/Services/SoundPannelServer_StartStopService.service /etc/systemd/system/SoundPannelServer_StartStopService.service
sudo systemctl enable MediaServer_StartStopService.service 
sudo systemctl enable SoundPannelServer_StartStopService.service
sudo systemctl daemon-reload
