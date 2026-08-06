#!/bin/bash

pd install debian

pd login debian --shared-tmp <<EOF
apt update
apt install xfce4 dbus-x11 -y
useradd lnxusr -s /bin/bash -m
exit
EOF

mkdir -p ~/.shortcuts

echo -e '#!/bin/bash\n\ntermux-x11 :0 -legacy-drawing &\nsleep 2\nproot-distro login --shared-tmp  debian  <<EOF\nsu - lnxusr\nexport DISPLAY=:0\nstartxfce4\nEOF' > ~/.shortcuts/debian.sh
chmod +x ~/.shortcuts/debian.sh
