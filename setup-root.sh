#!/bin/sh

# run as root

passwd -d root
passwd -d dns

touch /root/.hushlogin

###################################

apt clean
apt update
# apt list

apt install -y ubuntu-advantage-tools xdg-desktop-portal-kde software-properties-common ttf-mscorefonts-installer maliit-keyboard
apt install -y systemd-sysv htop tmux neofetch whois 
apt install -y zfsutils-linux gdisk sshfs exfatprogs
apt install -y wget neofetch otpclient oathtool radeontop glmark2 piper kcalc artha iw
apt install -y micro nano wxhexeditor okteta scite scilab
apt install -y firefox thunderbird 
apt install -y qbittorrent qbittorrent-nox 
apt install -y libreoffice libreoffice-kf5 okular calibre
apt install -y krita gimp
apt install -y haruna kaffeine vlc
apt install -y pcsxr pcsx2 retroarch
apt install -y clang gcc g++ binutils gcc-mingw-w64 g++-mingw-w64 make 
apt install -y openjdk-17-jdk openjdk-17-jre 
apt install -y nodejs npm
apt install -y lua5.4 luajit luarocks 
apt install -y nginx git openssh-client openssh-server kdiff3
apt install -y python3-pip python3-pylsp yt-dlp instaloader adb 
apt install -y poppler-utils zenmap ghostwriter skanpage
#apt install -y love godot3
apt install -y kiwix


###################################
# install powershell

apt-get update
source /etc/os-release
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
apt-get update
apt-get install -y powershell
#pwsh


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



######################################

# Hardware
# /etc/rc.local
echo '#!/bin/sh' > /etc/rc.local
echo -e "\n" >> /etc/rc.local

# USB wake from sleep, enabled
echo '
# USB wake from sleep, enabled
pwsh -command { gci /sys/bus/usb/devices/usb*/power/wakeup | % { 'enabled' > $_ }  }
' >> /etc/rc.local
echo -e "\n" >> /etc/rc.local

# unlock Drive
echo 'zpool import -af' >> /etc/rc.local
echo "echo 'password' | zfs mount -l IronWolf-8TB/DNS" >> /etc/rc.local

echo -e "\n\n\n" >> /etc/rc.local
echo 'exit 0' >> /etc/rc.local



######################################


######################################


# Python
# disable generating pycache
echo 'PYTHONDONTWRITEBYTECODE=1' >> /etc/environment


# Git
#git config --global push.autoSetupRemote true
#git config --global init.defaultBranch master


