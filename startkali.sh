#!/bin/bash

termux-x11 :0 &

sleep 2

proot-distro login --bind /data/data/com.termux/files/usr/tmp:/tmp kali  <<EOF
su kali
export DISPLAY=:0
startxfce4
EOF
