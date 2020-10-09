import telnetlib

Host = "127.0.0.1"
Port = "4212"
password = "MediaController"
song = "add https://youtu.be/FGBhQbmPwH8"



def action(act):
    tn.write(act.encode('ascii')+ b"\n")



tn = telnetlib.Telnet(Host, Port)
action(password)
action(song)
