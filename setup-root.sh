#!/bin/sh

# run as root

passwd -d root
passwd -d dns

#touch ~/.hushlogin
touch /root/.hushlogin

###################################

apt clean
apt update

py
apt install -y ubuntu-advantage-tools

apt install -y firefox thunderbird libreoffice neofetch nginx qbittorrent qbittorrent-nox krita gimp nodejs wget kaffeine vlc scite scilab xdg-desktop-portal-kde systemd-sysv htop retroarch zfsutils-linux gdisk sshfs tmux neofetch zenmap make otpclient oathtool radeontop software-properties-common ttf-mscorefonts-installer micro nano maliit-keyboard glmark2 piper git kcalc whois artha iw

apt install -y clang gcc g++ binutils gcc-mingw-w64 g++-mingw-w64 openjdk-17-jdk openjdk-17-jre wxhexeditor

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

# Change default shell
cat /etc/shells
chsh -s /usr/bin/pwsh root
chsh -s /usr/bin/pwsh dns

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




