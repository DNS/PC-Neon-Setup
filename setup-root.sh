#!/bin/sh

# run as root

passwd -d root
passwd -d dns

touch /root/.hushlogin

###################################

apt clean
apt update

apt install -y ubuntu-advantage-tools xdg-desktop-portal-kde software-properties-common ttf-mscorefonts-installer maliit-keyboard
apt install -y systemd-sysv htop tmux neofetch whois zfsutils-linux gdisk sshfs exfatprogs
apt install -y wget neofetch otpclient oathtool radeontop glmark2 piper kcalc artha iw
apt install -y micro nano wxhexeditor scite scilab
apt install -y firefox thunderbird libreoffice libreoffice-kf5
apt install -y qbittorrent qbittorrent-nox krita gimp haruna kaffeine vlc retroarch
apt install -y clang gcc g++ binutils gcc-mingw-w64 g++-mingw-w64 make openjdk-17-jdk openjdk-17-jre git nodejs openssh-client openssh-server lua5.4 luajit luarocks nginx
apt install -y python3-pip python3-pylsp yt-dlp instaloader adb 
apt install -y kdiff3 poppler-utils zenmap ghostwriter


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

# PowerShell

# disable update
echo 'POWERSHELL_UPDATECHECK="Off"' >> /etc/environment
echo 'POWERSHELL_TELEMETRY_OPTOUT=1' >> /etc/environment


# WARNING: using .nologo script is not compatible with sftp & sshfs

# Change default shell
echo '#!/usr/bin/pwsh

/usr/bin/pwsh -Login -NoLogo
' > /usr/bin/pwsh.nologo

chmod +x /usr/bin/pwsh.nologo

cat /etc/shells
chsh -s /usr/bin/pwsh.nologo root
chsh -s /usr/bin/pwsh.nologo dns


# disable

######################################

# Python

# disable generating pycache
echo 'PYTHONDONTWRITEBYTECODE=1' >> /etc/environment



# others

# git
git config --global push.autoSetupRemote true
git config --global init.defaultBranch master


# USB wake from sleep, enabled
@'
# USB wake from sleep, enabled
pwsh -command { gci /sys/bus/usb/devices/usb*/power/wakeup | % { 'enabled' > $_ }  }
'@ >> /etc/rc.local



