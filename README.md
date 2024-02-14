# dskcfg - Desktop Configuration

## Installation

For the default installation : 

```
cd ~ && mkdir -p Repositories && cd Repositories
git clone https://github.com/iv4n9f/dskcfg
cd dskcfg && chmod +x main.sh
./main.sh
```

For the configuration of the bitwarden password encryption please change the variable "password" in the ```main.sh``` file.

## Description

This repository installs a default desktop configuration for my own system you can use it, but remember to change it to suit your personal needs.

### Window Manager
- ```bspwm```
### Shortcut Manager
- ```sxhkd```
### Bar
- ```polybar```
### Modules
- ```date``` - ```Displays date, hour and timezone```
- ```user``` - ```Displays user and hostname```
- ```server``` - ```Displays the selected ip response time```
- ```target``` - ```Displays the target availability ( Could change the target with the utility set_target hostname/ip )```
- ```wan``` - ```Displays your own public ip ( Remember it if you share your screen )```
- ```ip``` - ```Displays the network interface attached ip```
- ```system``` - ```Displays the cpu, ram, swap and filesystem usage```
### Other Utilities installed
- ```brave```
- ```bitwarden```
- ```code```

## Test

Tested in :
- ``` Linux Kali 6.5.0-kali3-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.5.6-1kali1 (2023-10-09) x86_64 GNU/Linux ```
