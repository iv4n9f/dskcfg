# dskcfg - Desktop Configuration

## Installation

For the default install : 

```
cd ~ && mkdir -p Repositories && cd Repositories
git clone https://github.com/iv4n9f/dskcfg
cd dskcfg && chmod +x main.sh
./main.sh
```

For the configuration of the bitwarden password encryption please change the variable "password" in the ```main.sh``` file.

## Description

This repository installs a default desktop configuration for my own system you can use it, but remember to change it to suit your personal needs.

```
windows manager, shortcut manager and bar :

bspwm + sxhkd
polybar

bar modules for :

date , hour and timezone
user and hostname
workspaces
server response time
target availability check
volume
keyboard caps and layout indicator

public ip
lan ip
vpn ip

cpu usage
cpu temperature
ram usage
swap usage
root partition usage
home partition usage
external mounted filesystem usage

display manager config :

changed to black and font "Hack Nerd Font"

more utils : 

brave
bitwarden
visual studio code

```

## Test

Tested in :
```
Linux Kali 6.5.0-kali3-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.5.6-1kali1 (2023-10-09) x86_64 GNU/Linux
```