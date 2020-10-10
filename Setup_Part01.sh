#!/bin/sh
sudo apt update
sudo apt upgrade
sudo apt install screen -y
sudo apt install alsa-utils -y
sudo apt install vlc -y 
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install dpkg -y

ExcpectedLocation="/usr/lib/x86_64-linux-gnu/vlc/lua/playlist/youtube.luac"
LocationOnSystem=$(dpkg -L vlc-plugin-base | grep youtube.lua)

mkdir ~/temp
wget https://raw.githubusercontent.com/videolan/vlc/master/share/lua/playlist/youtube.lua -P ~/temp


sudo rm "$LocationOnSystem"
sudo cp ~/temp/youtube.lua "$LocationOnSystem"


sudo systemctl set-default multi-user
sudo rm -r ~/temp/

sudo mkdir /mnt/VLCMediaController
sudo mkdir /mnt/VLCMediaController/LaunchScripts

sudo cp Shell/LaunchScripts/LaunchMediaServer.sh /mnt/VLCMediaController/LaunchScripts/LaunchMediaServer.sh
sudo cp Shell/LaunchScripts/LaunchSoundPannelServer.sh /mnt/VLCMediaController/LaunchScripts/LaunchSoundPannelServer.sh
sudo chmod 0755 /mnt/VLCMediaController/LaunchScripts/LaunchMediaServer.sh
sudo chmod 0755 /mnt/VLCMediaController/LaunchScripts/LaunchSoundPannelServer.sh

sudo cp Shell/PulseAudio_Config/client.conf /etc/pulse/client.conf

sudo adduser ragnarok pulse-access
sudo adduser root pulse-access

sudo cp Shell/Services/PulseAudio.service /etc/systemd/system/PulseAudio.service
sudo cp Shell/Services/MediaServer_StartStopService.service /etc/systemd/system/MediaServer_StartStopService.service
sudo cp Shell/Services/SoundPannelServer_StartStopService.service /etc/systemd/system/SoundPannelServer_StartStopService.service
sudo systemctl enable PulseAudi.service
sudo systemctl enable MediaServer_StartStopService.service
sudo systemctl enable SoundPannelServer_StartStopService.service
sudo systemctl daemon-reload


echo "Rebooting in 10 second's to cance cance script and reboot manualy"
sleep 10
sudo reboot



