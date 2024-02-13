#!/bin/bash

dir=$(pwd)
user=$(whoami)

# Initial Enviroment

sudo apt update
sudo apt-get install make gcc libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev polybar bspwm sxhkd rofi feh python3-pip net-tools gnome-terminal sensors -y

git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install

mkdir -p /home/$user/.config/{bspwm,sxhkd,polybar}
mkdir /home/$user/.config/bspwm/scripts/
mkdir /home/$user/.config/polybar/modules/

cp $dir/bspwmrc /home/$user/.config/bspwm/
cp $dir/sxhkdrc /home/$user/.config/sxhkd/
cp $dir/config.ini /home/$user/.config/polybar/
cp $dir/launch.sh /home/$user/.config/polybar/
cp -r $dir/modules/ /home/$user/.config/polybar/
cp $dir/bspwm_resize /home/$user/.config/bspwm/scripts/bspwm_resize
cp $dir/wallpaper.jpeg /home/$user/Pictures/wallpaper.png
cp /etc/X11/xinit/xinitrc /home/$user/.xinitrc

echo "exec bspwm" >> /home/$user/.xinitrc

chmod u+x /home/$user/.config/bspwm/bspwmrc
chmod u+x /home/$user/.config/polybar/launch.sh
chmod u+x /home/$user/.config/bspwm/scripts/bspwm_resize

# Fonts

cd /home/$user/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
sudo unzip Hack.zip -d /usr/share/fonts/

cd $dir

# Utils

sudo apt-get install snapd -y && sudo systemctl enable snapd.apparmor && sudo systemctl start snapd.apparmor
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install code --classic
sudo snap install brave bitwarden