# Initial Installation

- We required below packages in termux.

```
pkg update && pkg upgrade -y
pkg install x11-repo proot-distro termux-x11-nightly -y
```

## Troubleshooting for future error

- If you are above android 12 you might see `exit by kill signal 9 (after starting server)` message. This means android is killing termux i.e. backgroud apps after hitting certain memory limit. Hence it is required to increase it.  
- Using adb to increase the memory limit.

```
pkg update
pkg install android-tools
```

- Enable `Developer Options` and enable `Wireless debugging` and click on `allow` if asked for prompt.
- Click on `Pair device with paring code`
- Return to termux and pair and connect with below commands

```
adb pair <ip>:<port>
<enter_pairing_code>
adb connect <ip>:<different_port>
adb devices
<you_should_see_one_entry>
```

- After connecting via adb refer below table to set appropriate `max_phantom_processes` limit.

| RAM    | Recommended max\_phantom\_processes |
| ------ | ----------------------------------- |
| ≤2 GB  | 16–32                               |
| 2–4 GB | 32–64                               |
| 4–8 GB | 64–128                              |
| 8 GB+  | 128–256                             |

- Execute below command to increase the `max_phantom_process` limit (I am setting it to 128)

```
adb shell "/system/bin/device_config put activity_manager max_phantom_processes 128"
adb shell "/system/bin/device_config set_sync_disabled_for_tests persistent"
```

- This will avoid unexpected termux crashing issue.

## proot-distro setup 

- create file called `kali.sh` in `/data/data/com.termux/files/usr/etc/proot-distro` that is `$PREFIX/etc/proot-distro`

```bash
DISTRO_NAME="kali"
TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-full-arm64.tar.xz"
```

- You should see `kali` after executing below command.

```
pd list
```

- Execute below command to install `kali`

```
pd install kali
```

## Install termux-x11 app

- To render GUI, I am using `termux-x11` app (native app for better performance; you can use tightvncserver for vnc - which is not in this scope)
- Install the app from here - https://github.com/termux/termux-x11/releases/tag/nightly
- After installing open and keep it running in the background

# Setup GUI

- open new terminal to start termux-x11 (make sure termux-x11 app is running)

```
termux-x11 :0
```

- After running you should see blank screen in termux-x11 app
- Open new terminal to start xfce from kali

```
pd login --bind /data/data/com.termux/files/usr/tmp:/tmp kali
su kali
export DISPLAY=:0
startxfce4
```

- You should see GUI in termux-x11 app.
