ExcpectedLocation="/usr/lib/x86_64-linux-gnu/vlc/lua/playlist/youtube.luac"
LocationOnSystem=$(dpkg -L vlc-plugin-base | grep youtube.lua)

sudo apt update
sudo apt upgrade
sudo apt install vlc -y
sudo apt install python3 -y
sudo apt install python3-pip -y
mkdir ~/temp
wget https://raw.githubusercontent.com/videolan/vlc/master/share/lua/playlist/youtube.lua -P ~/temp

if [ "$ExcpectedLocation" == "$LocationOnSystem" ]; then
	sudo rm "$ExcpectedLocation"
	sudo cp ~/temp/youtube.lua /usr/lib/x86_64-linux-gnu/vlc/lua/playlist/youtube.lua
else
	echo "Error cant continue unexpected location for youtube.lua"
fi

sudo systemctl set-default multi-user
echo "Rebooting in 30 second's to cance cance script and reboot manualy"
echo "After reboot start script 2"
sleep 30
sudo reboot



