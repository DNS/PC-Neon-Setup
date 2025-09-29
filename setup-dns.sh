mkdir ~/sandbox
cd ~/sandbox

git clone git@github.com:DNS/BIN.git
git clone git@github.com:DNS/PC-Neon-Setup.git
git clone git@github.com:DNS/Debian-Help.git


# mouse scroll
$a = gc -Raw ~/.config/kdeglobals
$a -Replace '\[KDE\]', "[KDE]`nWheelScrollLines=8" > ~/.config/kdeglobals


