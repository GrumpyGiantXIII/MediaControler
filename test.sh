LocationOnSystem=$(dpkg -L vlc-plugin-base | grep youtube.lua)
ExcpectedLocation="/usr/lib/x86_64-linux-gnu/vlc/lua/playlist/youtube.luac"


echo $LocationOnSystem
echo "expected location"
echo $ExcpectedLocation

if [ "$LocationOnSystem" == "$ExcpectedLocation" ]; then
	echo "succes sucker"
else
	echo "we failed"
fi
echo "end"
