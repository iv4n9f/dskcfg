# dskcfg

Desktop Configuration

For installation : 

cd ~ && mkdir -p Repositories && cd Repositories
git clone https://github.com/iv4n9f/dskcfg
cd dskcfg && sed -i s/password="password"/password="(Your bitwarden password if you want, if you dont want it , please remove this part or set it as 'password')"/g main.sh && chmod +x main.sh
./main.sh

Tested in :

Linux Kali 6.5.0-kali3-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.5.6-1kali1 (2023-10-09) x86_64 GNU/Linux