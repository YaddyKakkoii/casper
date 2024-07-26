#!/bin/bash
REPO="https://raw.githubusercontent.com/YaddyKakkoii/casper/main/"
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

clear
cd /root
function bannerterimakasih(){
clear
echo ""
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e  "${tyblue}│              \033[1;37mTERIMA KASIH                ${tyblue}│${NC}"
echo -e  "${tyblue}│         \033[1;37mSUDAH MENGGUNAKAN SCRIPT         ${tyblue}│${NC}"
echo -e  "${tyblue}│                \033[1;37mDARI YADDY TAMPAN           ${tyblue}│${NC}"
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}"
echo " "
}
function bannersetupdomain(){
clear
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│ \033[1;37mPlease select a your Choice to Set Domain${tyblue}│${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│  [ 1 ]  \033[1;37mDomain xxx.decil.my.id       ${NC}"
echo -e "${tyblue}│  "
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
}
#1 mostly used
function bannerdomain_decil(){
clear
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e  "${tyblue}│  \033[1;37mContoh subdomain xxx.decil.my.id       ${tyblue}│${NC}"
echo -e  "${tyblue}│    \033[1;37mxxx jadi subdomain kamu               ${tyblue}│${NC}"
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}"
echo " "
}

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
echo -ne "  \033[0;33mUpdate Domain.. \033[1;37m- \033[0;33m["
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
echo -ne "  \033[0;33mUpdate Domain... \033[1;37m- \033[0;33m["
done
echo -e "\033[0;33m]\033[1;37m -\033[1;32m Succes !\033[1;37m"
tput cnorm
}
res1() {
wget -qO domz "${REPO}domain1.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res2() {
wget -qO domz "${REPO}domain2.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res3() {
wget -qO domz "${REPO}domain3.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res4() {
wget -qO domz "${REPO}domain4.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res5() {
wget -qO domz "${REPO}domain5.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res6() {
wget -qO domz "${REPO}domain6.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res7() {
wget -qO domz "${REPO}domain7.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res8() {
wget -qO domz "${REPO}domain8.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res9() {
wget -qO domz "${REPO}domain9.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res10() {
wget -qO domz "${REPO}domain10.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res11() {
wget -qO domz "${REPO}domain11.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res12() {
wget -qO domz "${REPO}domain12.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res13() {
wget -qO domz "${REPO}domain13.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res14() {
wget -qO domz "${REPO}domain14.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res15() {
wget -qO domz "${REPO}domain15.sh" && chmod +x domz && ./domz
rm -f domz
clear
res16() {
wget -qO domz "${REPO}domain16.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res17() {
wget -qO domz "${REPO}domain17.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res18() {
wget -qO domz "${REPO}domain18.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
res19() {
wget -qO domz "${REPO}domain19.sh" && chmod +x domz && ./domz
rm -f domz
clear
}
function buatfolder() {
if [[ -e /etc/xray ]]; then rm -rf /etc/xray; fi
if [[ -e /etc/per ]]; then rm -rf /etc/per; fi
mkdir -p /etc/per
mkdir -p /etc/xray
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
}
function hapustrash(){
clear
rm /root/subdomainx
}
function gotoroot(){
cd /root
sleep 1
}

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│ \033[1;37mSilakan pilih Pilihan Anda untuk Mengatur Domain${tyblue}│${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}│  [ 1 ]  \033[1;37mMasukkan Domain Kamu  (dapet nameserver ramdom gratis)     ${NC}"
echo -e "${tyblue}│  "
echo -e "${tyblue}│  [ 2 ]  \033[1;37mDomain Gratis & Nameserver Gratis    ${NC}"
echo -e "${tyblue}│     "
echo -e "${tyblue}│  [ 3 ]  \033[1;37mMasukkan Domain & Nameserver Kamu (kamu pointing sendiri nameservermu)    ${NC}"
echo -e "${tyblue}│     "
echo -e "${tyblue}│  [ 0 ]  \033[1;37mSkip, Saya tidak ingin mengganti Current Domain    ${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
until [[ $domain =~ ^[0132]+$ ]]; do
read -p "   Please select numbers 0 1 2 or 3 : " domain
done
    if [[ $domain == "0" ]]; then
        bannerterimakasih
        echo "skipp menu set domain"
        sleep 2
        clear
    fi
    if [[ $domain == "1" ]]; then
        bannerterimakasih
        until [[ $dnss =~ ^[a-zA-Z0-9_.-]+$ ]]; do
            read -rp "Enter Your Domain : " -e dnss
        done
        buatfolder
        echo "$dnss" > /etc/xray/domain
        echo "IP=$dnss" > /var/lib/ipvps.conf
        echo ""
        clear
    fi
############## DOMAIN GRATIS DAN NAMESERVER GRATIS // FUNCTION START
    if [[ $domain == "2" ]]; then
        bannersetupdomain
        until [[ $domain2 =~ ^[1-9]+$ ]]; do
            read -p "   Please select numbers 1 sampai 9 : " domain2
        done
    fi
if [[ $domain2 == "1" ]]; then
bannerdomain_decil
until [[ $dn1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn1
done
touch /etc/xray/dns
buatfolder
echo "$dn1" > /root/subdomainx
gotoroot
fun_bar 'res1'
hapustrash
elif [[ $domain2 == "2" ]]; then
bannerdomain_sdc
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn2
done
touch /etc/xray/dns
buatfolder
echo "$dn2" > /root/subdomainx
gotoroot
fun_bar 'res2'
hapustrash
elif [[ $domain2 == "3" ]]; then
bannerdomainkakkoii
until [[ $dn3 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn3
done
touch /etc/xray/dns
buatfolder
echo "$dn3" > /root/subdomainx
gotoroot
fun_bar 'res3'
hapustrash
elif [[ $domain2 == "4" ]]; then
bannerdomain_vipcasper
until [[ $dn4 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn4
done
touch /etc/xray/dns
buatfolder
echo "$dn4" > /root/subdomainx
gotoroot
fun_bar 'res4'
hapustrash
elif [[ $domain2 == "5" ]]; then
bannerdomain_vpnvip
until [[ $dn5 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn5
done
touch /etc/xray/dns
buatfolder
echo "$dn5" > /root/subdomainx
gotoroot
fun_bar 'res5'
hapustrash
elif [[ $domain2 == "6" ]]; then
bannerdomain_bzofficial
until [[ $dn6 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn6
done
touch /etc/xray/dns
buatfolder
echo "$dn6" > /root/subdomainx
gotoroot
fun_bar 'res6'
hapustrash
elif [[ $domain2 == "7" ]]; then
bannerdomain_rere
until [[ $dn6 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn7
done
touch /etc/xray/dns
buatfolder
echo "$dn7" > /root/subdomainx
gotoroot
fun_bar 'res7'
hapustrash
elif [[ $domain2 == "8" ]]; then
bannerdomain_vpnpro
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn8
done
touch /etc/xray/dns
buatfolder
echo "$dn8" > /root/subdomainx
gotoroot
fun_bar 'res8'
hapustrash
elif [[ $domain2 == "9" ]]; then
bannerdomain_anuy
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn9
done
touch /etc/xray/dns
buatfolder
echo "$dn9" > /root/subdomainx
gotoroot
fun_bar 'res9'
hapustrash
elif [[ $domain2 == "10" ]]; then
bannerdomain_app
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn10
done
touch /etc/xray/dns
buatfolder
echo "$dn10" > /root/subdomainx
gotoroot
fun_bar 'res10'
hapustrash
elif [[ $domain2 == "11" ]]; then
bannerdomain_vpnpremi
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn11
done
touch /etc/xray/dns
buatfolder
echo "$dn11" > /root/subdomainx
gotoroot
fun_bar 'res11'
hapustrash
elif [[ $domain2 == "12" ]]; then
bannerdomain_rostovabrothers
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn12
done
touch /etc/xray/dns
buatfolder
echo "$dn12" > /root/subdomainx
gotoroot
fun_bar 'res12'
hapustrash
elif [[ $domain2 == "13" ]]; then
bannerdomain_brotherssh
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn13
done
touch /etc/xray/dns
buatfolder
echo "$dn13" > /root/subdomainx
gotoroot
fun_bar 'res13'
hapustrash
elif [[ $domain2 == "14" ]]; then
bannerdomain_ilyass
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn14
done
touch /etc/xray/dns
buatfolder
echo "$dn14" > /root/subdomainx
gotoroot
fun_bar 'res14'
hapustrash
elif [[ $domain2 == "15" ]]; then
bannerdomain_revalina
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn15
done
touch /etc/xray/dns
buatfolder
echo "$dn15" > /root/subdomainx
gotoroot
fun_bar 'res15'
hapustrash
elif [[ $domain2 == "16" ]]; then
bannerdomain_ktyounk
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn16
done
touch /etc/xray/dns
buatfolder
echo "$dn16" > /root/subdomainx
gotoroot
fun_bar 'res16'
hapustrash
elif [[ $domain2 == "17" ]]; then
bannerdomain_anuydev
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn17
done
touch /etc/xray/dns
buatfolder
echo "$dn17" > /root/subdomainx
gotoroot
fun_bar 'res17'
hapustrash
elif [[ $domain2 == "18" ]]; then
bannerdomain_vipcasme
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn18
done
touch /etc/xray/dns
buatfolder
echo "$dn18" > /root/subdomainx
gotoroot
fun_bar 'res18'
hapustrash
elif [[ $domain2 == "19" ]]; then
bannerdomain_rere2
until [[ $dn3 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn19
done
touch /etc/xray/dns
buatfolder
echo "$dn19" > /root/subdomainx
gotoroot
fun_bar 'res19'
hapustrash
fi
############## DOMAIN GRATIS DAN NAMESERVER GRATIS // FUNCTION END
    if [[ $domain == "3" ]]; then
        bannerterimakasih
        until [[ $dns1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
            read -rp "Masukan domain kamu Disini : " -e dns1
        done
        echo ""
        echo "$dns1" > /etc/xray/domain
        echo "IP=$dns1" > /var/lib/ipvps.conf
        bannerterimakasih
        until [[ $dns2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
            read -rp "Masukan Domain SlowDNS kamu Disini : " -e dns2
        done
        echo $dns2 >/etc/xray/dns
    fi
