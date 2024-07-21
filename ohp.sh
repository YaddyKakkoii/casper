#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# Ohp Script Mod By Yaddy Kakkoii Ganteng
MYIP=$(wget -qO- https://icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
domain=$(cat /etc/xray/domain)
bugvidio=quiz.int.vidio.com
buggopay=app.gopay.co.id
bugzoom=gomarketplacecontent-cf.zoom.us
bugwifiid=104.18.3.2
bugilped=104.26.6.171
bugilmupedia=ilmupedia.yaddykakkoii.my.id
bugmidtrans=104.17.3.81
bugisatopok=cdn.opensignal.com
Port_OpenVPN_TCP='1194';
Port_Squid='3128';
Port_SSH_OHP='8181';
Port_Dropbear_OHP='8282';
Port_OpenVPN_OHP='8383';

#WARNA_MERAH='\e[1;31m'
#WARNA_HIJAU='\e[0;32m'
#WARNA_BIRU='\e[0;34m'
#WARNA_NETRAL='\e[0m'
#Port_OpenVPN_TCP='1194';
#Port_Squid='3128';
#Port_OHP='8787';
#[Service]
#ExecStart=/usr/local/bin/ohp -port 8787 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:1194
#Restart=always
#RestartSec=3
#python2 /usr/local/bin/ws-ovpn 2082
#python3 /usr/local/bin/ws-ovpn 2082
#   wget -qO /usr/local/bin/ohp "http://gitlab.mzyaddy.ganteng.tech/ohp" && chmod +x /usr/local/bin/ohp

# // CEK STATUS (OHP) OPEN HTTP PUNCHER
sshohp=$( systemctl status ssh-ohp.service | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
dropbearohp=$( systemctl status dropbear-ohp.service | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
openvpnohp=$( systemctl status openvpn-ohp.service | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $sshohp == "running" ]]; then systemctl stop ssh-ohp.service; fi
if [[ $dropbearohp == "running" ]]; then systemctl stop dropbear-ohp.service; fi
if [[ $openvpnohp == "running" ]]; then systemctl stop openvpn-ohp.service; fi
clear
cd
# Download File Ohp
wget -qO /usr/local/bin/ohpserver "https://raw.githubusercontent.com/YaddyKakkoii/sclifetime/main/ohp"
chmod +x /usr/local/bin/ohpserver

# SSH OHP Port 8181 buat Service Untuk ssh OHP 
cat > /etc/systemd/system/ssh-ohp.service << END
[Unit]
Description=SSH OHP Service By Yaddy Kakkoii
Documentation=https://t.me/Crystalllz
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ohpserver -port 8181 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:22
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

# Dropbear OHP 8282
cat > /etc/systemd/system/dropbear-ohp.service << END
[Unit]]
Description=Dropbear OHP Service By Yaddy Kakkoii
Documentation=https://t.me/Crystalllz
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ohpserver -port 8282 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:109
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

# OpenVPN OHP 8383
cat > /etc/systemd/system/openvpn-ohp.service << END
[Unit]]
Description=OpenVPN OHP Service By Yaddy Kakkoii
Documentation=https://t.me/Crystalllz
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ohpserver -port 8383 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:1194
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl enable ssh-ohp
systemctl start ssh-ohp.service
systemctl restart ssh-ohp
systemctl enable dropbear-ohp
systemctl start dropbear-ohp.service
systemctl restart dropbear-ohp
systemctl enable openvpn-ohp
systemctl start openvpn-ohp.service
systemctl restart openvpn-ohp

###### 1 TCP OHP #####################
cat > /etc/openvpn/tcp-ohp.ovpn <<END
#http-proxy ${domain} 8383
############## WELCOME ###############
############# By Yaddykakkoii Magelang ##############
# Telegram : @Crystalllz
# Instagram : t.me/Crystalllz
# buatlah file pass.txt dalam folder yg sama dengan .ovpn
# format user password: line 1 user line 2 password
client
dev tun
proto tcp
remote "$bugvidio" 1194
resolv-retry infinite
route-method exe
nobind
remote-cert-tls server
cipher AES-256-CBC
auth SHA256
persist-key
persist-tun
auth-user-pass pass.txt
comp-lzo
verb 3

setenv FRIENDLY_NAME "TCP OHP VPN"
http-proxy xxxxxxxxx 8383
http-proxy-option CUSTOM-HEADER CONNECT HTTP/1.1
http-proxy-option CUSTOM-HEADER Host $bugvidio
http-proxy-option CUSTOM-HEADER X-Online-Host $bugvidio
http-proxy-option CUSTOM-HEADER X-Forward-Host $bugvidio
http-proxy-option CUSTOM-HEADER Connection: keep-alive
END

sed -i $MYIP2 /etc/openvpn/tcp-ohp.ovpn;

# masukkan certificatenya ke dalam config client TCP 1194
echo '<ca>' >> /etc/openvpn/tcp-ohp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/tcp-ohp.ovpn
echo '</ca>' >> /etc/openvpn/tcp-ohp.ovpn
cp /etc/openvpn/tcp-ohp.ovpn /home/vps/public_html/tcp-ohp.ovpn
cp /etc/openvpn/tcp-ohp.ovpn /var/www/html/tcp-ohp.ovpn



###### 2 POTATO MODEM #####################

cat > /etc/openvpn/Potato-modem.ovpn <<END
############## WELCOME ###############
############# By Yaddykakkoii Magelang ##############
# Telegram : @Crystalllz
# Instagram : t.me/Crystalllz
# buatlah file pass.txt dalam folder yg sama dengan .ovpn
# format user password: line 1 user line 2 password

setenv CLIENT_CERT 0
setenv opt block-outside-dns
client
dev tun
proto tcp
remote "$bugvidio" 1194
persist-tun
persist-key
persist-remote-ip
comp-lzo
reneg-sec 0
pull
setenv FRIENDLY_NAME "Potato OHP + OVPN For Modem"
resolv-retry infinite
remote-cert-tls server
verb 3
auth-user-pass pass.txt
cipher none
auth none
auth-nocache
script-security 2
http-proxy $domain 8383
#http-proxy $domain 3128

END
echo '<ca>' >> /etc/openvpn/Potato-modem.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/Potato-modem.ovpn
echo '</ca>' >> /etc/openvpn/Potato-modem.ovpn
cp /etc/openvpn/Potato-modem.ovpn /home/vps/public_html/Potato-modem.ovpn
cp /etc/openvpn/Potato-modem.ovpn /var/www/html/Potato-modem.ovpn

###### 3 POTATO OHP #####################

cat > /etc/openvpn/Potato-ohp.ovpn <<END
############## WELCOME ###############
############# By Yaddykakkoii Magelang ##############
# Telegram : @Crystalllz
# Instagram : t.me/Crystalllz
# buatlah file pass.txt dalam folder yg sama dengan .ovpn
# format user password: line 1 user line 2 password
client
dev tun
persist-tun
proto tcp
# remote www.google.com.ph 443
# We can also play with CRLFs
remote "$bugvidio" 1194
#remote "HEAD https://ajax.googleapis.com HTTP/1.1/r/n/r/n"
# Every types of Broken remote line setups/crlfs/payload are accepted, just put them inside of double-quotes
#remote "https://www.phcorner.net"
## use this line to modify OpenVPN remote port (this will serve as our fake ovpn port)
port 443

# This proxy uses as our main forwarder for OpenVPN tunnel.
#port ovpn ohp 8383 squid 3128
#http-proxy $domain 3128
http-proxy $domain 8383

persist-remote-ip
resolv-retry infinite
connect-retry 0 1
remote-cert-tls server
nobind
reneg-sec 0
keysize 0
rcvbuf 0
sndbuf 0
verb 2
comp-lzo
auth none
auth-nocache
cipher none
setenv CLIENT_CERT 0
auth-user-pass pass.txt
END
echo '<ca>' >> /etc/openvpn/Potato-ohp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/Potato-ohp.ovpn
echo '</ca>' >> /etc/openvpn/Potato-ohp.ovpn
cp /etc/openvpn/Potato-ohp.ovpn /home/vps/public_html/Potato-ohp.ovpn
cp /etc/openvpn/Potato-ohp.ovpn /var/www/html/Potato-ohp.ovpn


#------------------------------
printf 'INSTALLATION COMPLETED !\n'
sleep 0.5
printf 'CHECKING LISTENING PORT\n'
    if [ -n "$(ss -tupln | grep ohpserver | grep -w 8181)" ]
    then
        echo 'SSH OHP Redirection Running'
    else
        echo 'SSH OHP Redirection Not Found, please check manually'
    fi
sleep 0.5
    if [ -n "$(ss -tupln | grep ohpserver | grep -w 8282)" ]
    then
        echo 'Dropbear OHP Redirection Running'
    else
        echo 'Dropbear OHP Redirection Not Found, please check manually'
    fi
sleep 0.5
    if [ -n "$(ss -tupln | grep ohpserver | grep -w 8383)" ]
    then
        echo 'OpenVPN OHP Redirection Running'
    else
        echo 'OpenVPN OHP Redirection Not Found, please check manually'
    fi
sleep 0.5
cd 
echo ""
echo -e "${GREEN}Done Installing OHP Server${NC}"
echo -e "Port SSH OHP: $Port_SSH_OHP"
echo -e "Port DropBear OHP: $Port_Dropbear_OHP"
echo -e "Port OVPN OHP: $Port_OpenVPN_OHP"
echo -e "Port OVPN TCP: $Port_OpenVPN_TCP"
echo -e "Port SQUID PROXY: $Port_Squid"
echo ""
echo -e "Link Download OVPN TCP domain : http://$MYIP:89/domain.tcp.ovpn"
echo -e "Link Download OVPN TCP ip : http://$MYIP:89/ip.tcp.ovpn"
echo -e "Link Download OVPN TCP pointing : http://$MYIP:89/pointing.tcp.ovpn"
echo -e "Link Download OVPN potato UDP : http://$MYIP:89/Potato-udp.ovpn"
echo -e "Link Download OVPN potato NTLS : http://$MYIP:89/Potato-ntls.ovpn"
echo -e "Link Download OVPN potato SSL : http://$MYIP:89/Potato-ssl.ovpn"
echo ""
echo -e "Link Download OVPN TCP  : http://$MYIP:89/tcp.ovpn"
echo -e "Link Download OVPN TCP udp : http://$MYIP:89/udp.ovpn"
echo -e "Link Download OVPN TCP ssl : http://$MYIP:89/ssl.ovpn"
echo ""
echo -e "Link Download OVPN tcp OHP : http://$MYIP:89/tcp-ohp.ovpn"
echo -e "Link Download OVPN potato modem : http://$MYIP:89/Potato-modem.ovpn"
echo -e "Link Download OVPN potato OHP : http://$MYIP:89/Potato-ohp.ovpn"
echo ""
echo ""
echo -e "Yaddy Kakkoii Magelang"
echo ""
echo ""
sleep 3
