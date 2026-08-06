#!/bin/bash

pd install -n kali https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-full-arm64.tar.xz


pd login kali --shared-tmp <<EOF
apt update
apt install xfce4 dbus-x11 -y
useradd kali -s /bin/bash -m
exit
EOF

mkdir -p ~/.shortcuts

echo -e '#!/bin/bash\n\ntermux-x11 :0 -legacy-drawing &\nsleep 2\nproot-distro login --shared-tmp  kali  <<EOF\nsu - kali\nexport DISPLAY=:0\nstartxfce4\nEOF' > ~/.shortcuts/kali.sh
chmod +x ~/.shortcuts/kali.sh
