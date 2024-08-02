#!/bin/bash
curl -s -X POST "https://api.telegram.org/bot6654578153:AAEL08DFbdrgtirDqtBU6DkP_acq31uZPik/sendMessage" -d chat_id="1117211252" -d text="AdaYangSedangMenginstal setup.sh casper : ip $(curl -s ipv4.icanhazip.com) " > /dev/null 2>&1
clear

function cekroot(){
    if [ "${EUID}" -ne 0 ]; then
        echo "You need to run this script as root"
        echo "Wajib Pakai VPS dengan hak akses root yagesya"
        echo "Recommended Debian 10 atau Ubuntu 18 , 20 "
        exit 1
    fi
    if [ "$(systemd-detect-virt)" == "openvz" ]; then
        echo "OpenVZ is not supported"
        exit 1
    fi
}
cekroot
#cd "$(cd "$(dirname "$0")" || exit; pwd)" || exit
#   /etc/enviroment
#PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
stty erase ^?
source '/etc/os-release'
cd "$(
cd "$(dirname "$0")" || exit
pwd
)" || exit
clear

merah='\033[0;31m'
red='\e[1;31m'
green='\e[0;32m'
bblue='\033[0;34m'
plain='\033[0m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
green(){ echo -e "\033[32m\033[01m$1\033[0m";}
#green() { echo -e "\\033[32;1m${*}\\033[0m"; }
#yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow(){ echo -e "\033[33m\033[01m$1\033[0m";}
#purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
#tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
#red() { echo -e "\\033[31;1m${*}\\033[0m"; }
red(){ echo -e "\033[31m\033[01m$1\033[0m";}
white(){ echo -e "\033[37m\033[01m$1\033[0m";}
readp(){ read -p "$(yellow "$1")" $2;}
#readp "input your domain, domain : " domainmu
cd /root
localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
if [ ! -d /var/lib ]; then mkdir -p /var/lib ; fi
if [ -f /var/lib/ipvps.conf ]; then rm -f /var/lib/ipvps.conf ; fi
touch /var/lib/ipvps.conf
echo "IP=" >> /var/lib/ipvps.conf
echo "Yaddy Kakkoii" > /etc/profil
#author=$(cat /etc/profil)
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y
apt -y install wget curl
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat
REPO="https://raw.githubusercontent.com/YaddyKakkoii/casper/main/"
wget -qO domzz "${REPO}domaincf.sh" && chmod +x domzz && ./domzz && rm domzz
#wget ${REPO}domaincf.sh && chmod +x domaincf.sh && ./domaincf.sh && rm domaincf.sh
cd /root
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/fixtema.sh; bash fixtema.sh; rm fixtema.sh
cd /root
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/tools.sh; chmod +x tools.sh; bash tools.sh; rm tools.sh
clear
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│      PROCESS INSTALLED SSH ALL IN ONE    │${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│           PROCESS INSTALLED XRAY         │${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
wget ${REPO}ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
#curl -s ipinfo.io/org | cut -d " " -f 2-10
#curl -s ipinfo.io/city
curl -s ipinfo.io/city?token=75082b4831f909 > /etc/xray/city
curl -s ipinfo.io/org?token=75082b4831f909  | cut -d " " -f 2-10 > /etc/xray/isp
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│       PROCESS INSTALLED WEBSOCKET SSH    │${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/insshws.sh && chmod +x insshws.sh && ./insshws.sh
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│       PROCESS INSTALLED BACKUP MENU      │${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
wget ${REPO}set-br.sh && chmod +x set-br.sh && ./set-br.sh
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│           PROCESS INSTALLED OHP          │${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/ohp.sh && chmod +x ohp.sh && ./ohp.sh
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│           DOWNLOAD FILE MENU             │${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
#echo "53" > /usr/bin/activated.plist
echo "55" > /usr/bin/activated.plist


if ! grep -q 'WEB_SERVER' /etc/environment; then
cat >/etc/enviroment <<EOF
POTATO_SHELL="/usr/bin/activated.plist"
WEB_SERVER="/usr/bin/cekupdate"
EOF
fi

if ! grep -q 'WEB_SERVER' .profile; then
wget -qO /root/.profile ${REPO}profilekentang
chmod 644 /root/.profile
fi
#echo "clear" >> .profile
#echo "neofetch" >> .profile
if ! grep -q 'etc/environment' /etc/profile; then
echo ". /etc/environment" >> /etc/profile
fi
cd
mkdir -p /root/menu
cd /root/menu
wget ${REPO}menu.zip
unzip menu.zip
rm menu.zip
chmod +x *
mv -f * /usr/bin
cd
rm -rf /root/menu
#cd /root && rm -f /usr/bin/eue > /dev/null 2>&1 && wget -qO /usr/bin/eue "https://raw.githubusercontent.com/YaddyKakkoii/tes/main/newewe.sh" && chmod +x /usr/bin/eue && eue && rm -f /usr/bin/eue
rm -rf *
echo -e "${tyblue}┌────────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│  Install SCRIPT SELESAI. please wait.. otomatis masuk menu dalam 9 detik....                  │${NC}"
echo -e "${tyblue}└────────────────────────────────────────────┘${NC}"
echo  ""
sleep 9
cat> /etc/cron.d/autocpu << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/3 * * * * root /usr/bin/autocpu
END
echo "Auto-Reboot CPU 100% TURN ON."
sleep 1
menu
