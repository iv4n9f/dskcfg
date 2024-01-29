#!/bin/bash

dir=$(pwd)
user=$(whoami)

sudo apt update
sudo apt-get install make gcc libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev polybar bspwm sxhkd rofi feh-y

git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install

mkdir -p /home/$user/.config/{bspwm,sxhkd,polybar}
mkdir /home/$user/.config/bspwm/scripts/

cp $dir/bspwmrc /home/$user/.config/bspwm/
cp $dir/sxhkdrc /home/$user/.config/sxhkd/
cp $dir/config.ini /home/$user/.config/polybar/
cp $dir/launch.sh /home/$user/.config/polybar/
cp $dir/bspwm_resize /home/$user/.config/bspwm/scripts/bspwm_resize
cp $dir/wallpaper.jpeg /home/$user/Pictures/wallpaper.jpeg
cp /etc/X11/xinit/xinitrc /home/$user/.xinitrc

echo "exec bspwm" >> /home/$user/.xinitrc

chmod u+x /home/$user/.config/bspwm/bspwmrc
chmod u+x /home/$user/.config/polybar/launch.sh
chmod u+x /home/$user/.config/bspwm/scripts/bspwm_resize