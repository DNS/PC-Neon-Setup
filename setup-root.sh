#!/bin/sh

# run as root

passwd -d root
passwd -d dns

#touch ~/.hushlogin
touch /root/.hushlogin

###################################

apt clean
apt update

apt install -y ubuntu-advantage-tools xdg-desktop-portal-kde software-properties-common ttf-mscorefonts-installer maliit-keyboard

apt install -y systemd-sysv htop tmux neofetch zenmap whois zfsutils-linux gdisk sshfs

apt install -y micro nano wxhexeditor scite scilab

apt install -y firefox thunderbird libreoffice neofetch nginx qbittorrent qbittorrent-nox krita gimp wget kaffeine vlc retroarch otpclient oathtool radeontop glmark2 piper kcalc artha iw

apt install -y clang gcc g++ binutils gcc-mingw-w64 g++-mingw-w64 make openjdk-17-jdk openjdk-17-jre git nodejs

apt install -y python3-pip python3-pylsp yt-dlp instaloader


###################################
# install powershell

apt-get update
source /etc/os-release
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
apt-get update
apt-get install -y powershell
pwsh


###################################
# Change default shell
@'
#!/usr/bin/pwsh

/usr/bin/pwsh -Login -NoLogo

'@ | Out-File /usr/bin/pwsh.nologo

chmod +x /usr/bin/pwsh.nologo

cat /etc/shells
chsh -s /usr/bin/pwsh.nologo root
chsh -s /usr/bin/pwsh.nologo dns

######################################

# others

# git
git config --global push.autoSetupRemote true
git config --global init.defaultBranch master


# wake from USB devices
grep . /sys/bus/usb/devices/*/power/wakeup
echo enabled > /sys/bus/usb/devices/usb1/power/wakeup
echo enabled > /sys/bus/usb/devices/usb2/power/wakeup
echo enabled > /sys/bus/usb/devices/usb3/power/wakeup
echo enabled > /sys/bus/usb/devices/usb4/power/wakeup
echo enabled > /sys/bus/usb/devices/usb5/power/wakeup
echo enabled > /sys/bus/usb/devices/usb6/power/wakeup
echo enabled > /sys/bus/usb/devices/usb7/power/wakeup
echo enabled > /sys/bus/usb/devices/usb8/power/wakeup




