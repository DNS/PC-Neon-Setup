#!/bin/sh

# run as root

passwd -d root
passwd -d dns

touch /root/.hushlogin

###################################

apt clean
apt update

apt install -y ubuntu-advantage-tools xdg-desktop-portal-kde software-properties-common ttf-mscorefonts-installer maliit-keyboard
apt install -y systemd-sysv htop tmux neofetch zenmap whois zfsutils-linux gdisk sshfs exfatprogs
apt install -y micro nano wxhexeditor scite scilab
apt install -y firefox thunderbird libreoffice neofetch nginx qbittorrent qbittorrent-nox krita gimp wget kaffeine vlc retroarch otpclient oathtool radeontop glmark2 piper kcalc artha iw
apt install -y clang gcc g++ binutils gcc-mingw-w64 g++-mingw-w64 make openjdk-17-jdk openjdk-17-jre git nodejs openssh-client openssh-server lua5.4 luajit luarocks
apt install -y python3-pip python3-pylsp yt-dlp instaloader adb 


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
# WARNING: using .nologo script is not compatible with sftp & sshfs

# Change default shell
echo '#!/usr/bin/pwsh

/usr/bin/pwsh -Login -NoLogo
' > /usr/bin/pwsh.nologo

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
echo enabled > grep . /sys/bus/usb/devices/*/power/wakeup
# gci /sys/bus/usb/devices/*/power/wakeup | %{ 'enabled' > $_ }
