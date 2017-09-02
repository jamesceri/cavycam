#!/bin/bash

x11vnc -rfbauth /home/pi/.vnc/passwd -no6 -noipv6 -reopen -forever -shared -display :0 &> /dev/null &

