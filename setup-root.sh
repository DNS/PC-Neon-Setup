#!/bin/sh

# run as root

passwd -d root
passwd -d dns

#touch ~/.hushlogin
touch /root/.hushlogin

###################################

apt clean
apt update


apt install -y ubuntu-advantage-tools

apt install -y firefox thunderbird libreoffice neofetch python3-pip nginx qbittorrent qbittorrent-nox krita gimp nodejs wget kaffeine vlc scite scilab xdg-desktop-portal-kde systemd-sysv htop retroarch zfsutils-linux gdisk sshfs tmux neofetch zenmap make otpclient oathtool gcc g++ binutils gcc-mingw-w64 g++-mingw-w64 openjdk-17-jdk openjdk-17-jre radeontop software-properties-common ttf-mscorefonts-installer micro nano maliit-keyboard glmark2 piper git kcalc whois artha


###################################
# install powershell

apt-get update
apt-get install -y wget
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
git config --global init.defaultBranch master


