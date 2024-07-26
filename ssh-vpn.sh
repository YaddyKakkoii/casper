#!/bin/bash
REPO="https://raw.githubusercontent.com/YaddyKakkoii/casper/main/"
REPOX="https://raw.githubusercontent.com/YaddyKakkoii/sclifetime/main/"
export DEBIAN_FRONTEND=noninteractive
source /etc/os-release
ver=$VERSION_ID
#MYIP=$(wget -qO- ipinfo.io/ip);
MYIP=$(curl -sS ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ETHO=$(ip -o $ETHO -4 route show to default | awk '{print $5}');
source /etc/os-release
#detail nama perusahaan
country=ID
state=Indonesia
locality=Jakarta
organization=phreaker
organizationalunit=PHREAKER
commonname=yaddykakkoii
email=yadicakepp@gmail.com
# simple password minimal
#wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/muhammadnoor674/anuy/main/password"
#curl -sS https://raw.githubusercontent.com/YaddyKakkoii/casper/main/password | openssl aes-256-cbc -d -a -pass pass:scvps07gg -pbkdf2 > /etc/pam.d/common-password
curl -sS ${REPO}password | openssl aes-256-cbc -d -a -pass pass:scvps07gg -pbkdf2 > /etc/pam.d/common-password
chmod +x /etc/pam.d/common-password
cd /root
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END
chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local.service
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
cd /root
# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
#apt --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
# install webserver nginx
apt -y install nginx
if [[ -e /etc/nginx/sites-enabled/default ]]; then rm /etc/nginx/sites-enabled/default; fi
if [[ -e /etc/nginx/sites-available/default ]]; then rm /etc/nginx/sites-available/default; fi
curl ${REPO}nginx.conf > /etc/nginx/nginx.conf
curl ${REPO}vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
wget -O /home/vps/public_html/index.html "${REPO}index.html"
/etc/init.d/nginx restart
cd /root

# install badvpn
wget -O /usr/sbin/badvpn "${REPO}badvpn" >/dev/null 2>&1
chmod +x /usr/sbin/badvpn > /dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn1.service "${REPO}badvpn1.service" >/dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn2.service "${REPO}badvpn2.service" >/dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn3.service "${REPO}badvpn3.service" >/dev/null 2>&1

systemctl disable badvpn1
systemctl stop badvpn1
systemctl enable badvpn1
systemctl start badvpn1
systemctl restart badvpn1

systemctl disable badvpn2
systemctl stop badvpn2
systemctl enable badvpn2
systemctl start badvpn2
systemctl restart badvpn2

systemctl disable badvpn3
systemctl stop badvpn3
systemctl enable badvpn3
systemctl start badvpn3
systemctl restart badvpn3

function alterbadvpn() {
sed -i '$ i\screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7900 --max-clients 500
}
#alterbadvpn
cd /root
# setting port ssh
#sed -i 's/Port 22/#Port 22/g' /etc/ssh/sshd_config
if ! grep -q '58080' /etc/ssh/sshd_config;then
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 500' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 40000' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 51443' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 58080' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 53' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 22' /etc/ssh/sshd_config
fi
cd /root
# install dropbear
apt -y install dropbear
if ! grep -q '69' /etc/default/dropbear;then
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/#DROPBEAR_EXTRA_ARGS=/g' /etc/default/dropbear
sed -i '/arguments for Dropbear/a DROPBEAR_EXTRA_ARGS="-p 50000 -p 109 -p 110 -p 69"' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
fi
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
# install squid
cd /root
function install_squid() {
MYIP=$(curl -sS ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
apt -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/YaddyKakkoii/casper/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf
}
install_squid
#MYIP=$(curl -sS ipv4.icanhazip.com);MYIP2="s/xxxxxxxxx/$MYIP/g";sed -i $MYIP2 squid3.conf;
#install sslh
#apt-get update
function install_sslh() {
cat << EOF | sudo debconf-set-selections
# Run sslh:
sslh    sslh/inetd_or_standalone        select  standalone
EOF
apt install sslh -y
cd /etc/default/
if [[ -e /etc/default/sslh ]]; then rm /etc/default/sslh; fi
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/sslh
cd /root

}
install_sslh
#sshws accept 443/444 connect 2053/22/700
#dropbear accept 777,222/8443,8880 connect 22/109 | 143,109,110,69
#ovpn accept 442/990 connect 1194/1194
#DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 / 0.0.0.0:2093 
# --ssh 127.0.0.1:22 /  --ssh 127.0.0.1:389 / --ssh 127.0.0.1:109 
#  --ssl 127.0.0.1:109 /--ssl 127.0.0.1:443 /--ssl 127.0.0.1:445 / --ssl 127.0.0.1:447 / --ssl 127.0.0.1:777
#   --openvpn 127.0.0.1:1194 /   --openvpn 127.0.0.1:3268 3128
#    --http 127.0.0.1:8880 8443
#[stunnelws] accept = 443 connect = 127.0.0.1:2053
#[dropbear] accept = 222 connect = 127.0.0.1:22
#[dropbear] accept = 777 connect = 127.0.0.1:22
#[openvpn] accept = 442 connect = 127.0.0.1:1194

# install stunnel
cd /root
function install_stunnel() {
apt update -y && apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 8880
connect = 127.0.0.1:22

[dropbear]
accept = 8443
connect = 127.0.0.1:109

[ws-stunnel]
accept = 444
connect = 700

[openvpn]
accept = 990
connect = 127.0.0.1:1194

END
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart
}
install_stunnel

cd /root
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh
cd /root
wget ${REPO}udp-custom.sh && chmod +x udp-custom.sh && ./udp-custom.sh 2200
wget ${REPO}lolcat.sh &&  chmod +x lolcat.sh && ./lolcat.sh
rm /root/udp-custom.sh
# memory swap 10gb
cd /root
dd if=/dev/zero of=/swapfile bs=1024 count=5242880
mkswap /swapfile
chown root:root /swapfile
chmod 0600 /swapfile >/dev/null 2>&1
swapon /swapfile >/dev/null 2>&1
sed -i '$ i\/swapfile      swap swap   defaults    0 0' /etc/fstab
# install fail2ban
apt -y install fail2ban
function bledos(){
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'
}
if [ -d '/usr/local/ddos' ]; then
    echo; echo; echo "Please un-install the previous version first"
    #exit 0
    clear
else
    mkdir /usr/local/ddos
    bledos
fi

if ! grep -q 'Banner /etc/issue.net' /etc/ssh/sshd_config; then
    echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
fi

if ! grep -q 'DROPBEAR_BANNER="/etc/issue.net"' /etc/default/dropbear; then
    sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
fi
wget -qO /etc/issue.net "${REPOX}issue.net" && chmod +x /etc/issue.net

wget ${REPO}bbr.sh && chmod +x bbr.sh && ./bbr.sh
function blokirtorrent() {
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
}
blokirtorrent
cd /usr/bin
wget -qO speedtest "${REPO}speedtest_cli.py"
wget -qO xp "${REPOX}xp.sh"
chmod +x speedtest
chmod +x xp
cd /root

if [ ! -f "/etc/cron.d/xp_otm" ]; then
cat> /etc/cron.d/xp_otm << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 0 * * * root /usr/bin/xp
END
fi

if [ ! -f "/etc/cron.d/bckp_otm" ]; then
cat> /etc/cron.d/bckp_otm << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 5 * * * root /usr/bin/bottelegram
END
fi

cat> /etc/cron.d/tendang << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/13 * * * * root /usr/bin/tendang
END

cat> /etc/cron.d/xraylimit << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/15 * * * * root /usr/bin/xraylimit
END

service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
service cron start >/dev/null 2>&1

cd /root
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart
#screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7100 --max-clients 500
#screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7200 --max-clients 500
#screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7300 --max-clients 500
#screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7400 --max-clients 500
#screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7500 --max-clients 500
#screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7600 --max-clients 500
#screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7700 --max-clients 500
#screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7800 --max-clients 500
#screen -dmS badvpn badvpn --listen-addr 127.0.0.1:7900 --max-clients 500
#history -c
#echo "unset HISTFILE" >> /etc/profile
#Install Edu insshws
#echo "0 0 * * * root clear-log && reboot" >> /etc/crontab
#echo "0 0 * * * root xp" >> /etc/crontab

rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
rm -f /root/bbr.sh
rm -rf /etc/apache2

clear
