#!/bin/bash
ipsaya=$(curl -sS ipinfo.io/ip)
myip=$(curl -sS ipv4.icanhazip.com)
IP=$(wget -qO- ipv4.icanhazip.com);
date_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep "< date:" | sed -e 's/< date: //')
date_list=`date +"%Y-%m-%d" -d "$date_server"`
date=$(date +"%Y-%m-%d")
echo "Date From Server: $date_server "
echo $date_list
###########- COLOR CODE -##############
colornow=$(cat /etc/casper/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/casper/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/casper/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}⇱ UPDATE ⇲                    ${NC} $COLOR1 $NC"
echo -e "$COLOR1 ${NC} ${COLBG1}             ${WH}⇱ SCRIPT TERBARU ⇲                ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

# download menu
cd /usr/bin
function deletemenulawas() {
rm -rf menu
rm -rf m-vmess
rm -rf m-vless
rm -rf m-trojan
rm -rf m-system
rm -rf m-sshovpn
rm -rf m-ssws
rm -rf running
rm -rf m-backup
rm -rf m-theme
rm -rf m-ip
rm -rf m-bot
rm -rf update
rm -rf ws-dropbear
rm -rf bckpbot
rm -rf tendang
rm -rf bottelegram
rm -rf restore
rm -rf backup
rm -rf cleaner
rm -rf m-allxray
rm -rf xraylimit
rm -rf xp
rm -rf trialvmess
rm -rf trialvless
rm -rf trialtrojan
rm -rf trialssh
rm -rf autocpu
rm -rf bantwidth
}
#deletemenulawas

fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
REPO="https://raw.githubusercontent.com/YaddyKakkoii/casper/main/"
#   wget "https://raw.githubusercontent.com/YaddyKakkoii/casper/main/menu.zip"
cd
mkdir /root/menu
cd /root/menu
wget ${REPO}menuapdt.zip
unzip menuapdt.zip
rm menuapdt.zip
chmod +x *
mv -f * /usr/bin
cd
rm -rf /root/menu
clear
}
echo -e ""
echo -e "  \033[1;91m Update Script...\033[1;37m"
fun_bar 'res1'

echo -e ""

cd
menu
