#!/bin/bash

password="password"
dir=$(pwd)
user=$(whoami)
timezone="Europe/Madrid"

# Initial Enviroment

sudo apt update
sudo apt-get install make gcc libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev polybar bspwm sxhkd rofi feh python3-pip net-tools gnome-terminal lm-sensors xclip jq wireguard resolvconf curl -y

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
cp $dir/wallpaper.png /home/$user/Pictures/wallpaper.png
sudo cp $dir/set_target /usr/bin/set_target
sudo cp $dir/bitwarden /usr/bin/bitwarden
sudo cp $dir/brave /usr/bin/brave
cp /etc/X11/xinit/xinitrc /home/$user/.xinitrc

echo "exec bspwm" >> /home/$user/.xinitrc

chmod u+x /home/$user/.config/bspwm/bspwmrc
chmod u+x /home/$user/.config/polybar/launch.sh
chmod u+x /home/$user/.config/bspwm/scripts/bspwm_resize
chmod +x /home/$user/.config/polybar/modules/*.sh
sudo chmod +x /usr/bin/set_target
sudo chmod +x /usr/bin/bitwarden
sudo chmod +x /usr/bin/brave

# Fonts

cd /home/$user/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
sudo unzip Hack.zip -d /usr/share/fonts/

# Themes
cd /home/$user/Downloads
git clone https://github.com/lr-tech/rofi-themes-collection.git
cd rofi-themes-collection
mkdir -p ~/.local/share/rofi/themes/
cp themes/rounded-common.rasi ~/.local/share/rofi/themes/
cp themes/rounded-blue-dark.rasi ~/.local/share/rofi/themes/


# Utils

cd $dir

sudo apt-get install snapd -y && sudo systemctl enable snapd.apparmor && sudo systemctl start snapd.apparmor
sudo systemctl enable snapd.socket && sudo systemctl start snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sleep 10
sudo snap install code --classic
sudo snap install bitwarden

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list 
sudo apt update
sudo apt install brave-browser -y

# Personal Config

mkdir /home/$user/Credentials /home/$user/Projects /home/$user/Downloads /home/$user/Pictures /home/$user/Videos /home/$user/Music /home/$user/Documents /home/$user/.ssh
sudo chown -R $user:$user /home/$user/Credentials /home/$user/Projects /home/$user/Downloads /home/$user/Pictures /home/$user/Videos /home/$user/Music /home/$user/Documents /home/$user/.ssh
echo "$password" > /home/$user/Credentials/bit.pas
mkdir -p /home/$user/Credentials/.tmp /home/$user/Credentials/.keys
openssl genpkey -algorithm RSA -out /home/$user/Credentials/.keys/private_key.pem
openssl rsa -pubout -in /home/$user/Credentials/.keys/private_key.pem -out /home/$user/Credentials/.keys/public_key.pem
openssl pkeyutl -encrypt -pubin -inkey /home/$user/Credentials/.keys/public_key.pem -in /home/$user/Credentials/bit.pas -out /home/$user/Credentials/bit.enc && rm /home/$user/Credentials/bit.pas
set_target localhost