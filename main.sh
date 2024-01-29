#!/bin/bash

dir=$(pwd)

sudo apt update
sudo apt-get install make gcc libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev polybar bspwm sxhkd rofi feh-y

git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install

mkdir -p ~/.config/{bspwm,sxhkd,polybar}
mkdir ~/.config/bspwm/scripts/

cp $dir/bspwmrc ~/.config/bspwm/
cp $dir/sxhkdrc ~/.config/sxhkd/
cp $dir/config.ini ~/.config/polybar/
cp $dir/launch.sh ~/.config/polybar/
cp $dir/bspwm_resize ~/.config/bspwm/scripts/bspwm_resize
cp $dir/wallpaper.jpeg ~/Pictures/wallpaper.jpeg
cp /etc/X11/xinit/xinitrc ~/.xinitrc

echo "exec bspwm" >> ~/.xinitrc

chmod u+x ~/.config/bspwm/bspwmrc
chmod u+x ~/.config/polybar/launch.sh
chmod u+x ~/.config/bspwm/scripts/bspwm_resize