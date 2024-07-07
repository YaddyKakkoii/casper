#!/bin/bash
REPO="https://raw.githubusercontent.com/YaddyKakkoii/casper/main/"
#REPOX="https://raw.githubusercontent.com/YaddyKakkoii/sclifetime/main/"
NC='\e[0m'
green='\e[0;32m'
WH='\e[1;36m'
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
sshwsenabler=$( systemctl status sshws.service | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
serviswstunnel=$( systemctl status ws-stunnel.service | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
serviswsovpn=$( systemctl status ws-ovpn.service | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
serviswsdropbear=$( systemctl status ws-dropbear.service | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $sshwsenabler == "active" ]]; then systemctl stop sshws.service & tmux kill-session -t sshws; fi
if [[ $serviswstunnel == "active" ]]; then systemctl stop ws-stunnel.service; fi
if [[ $serviswsovpn == "active" ]]; then systemctl stop ws-ovpn.service; fi
if [[ $serviswsdropbear == "active" ]]; then systemctl stop ws-dropbear.service; fi
if [ -f /usr/bin/ssh-wsenabler ]; then rm -f /usr/bin/ssh-wsenabler; fi
if [ -f /usr/local/bin/ws-dropbear ]; then rm -f /usr/local/bin/ws-dropbear; fi
if [ -f /usr/local/bin/ws-stunnel ]; then rm -f /usr/local/bin/ws-stunnel; fi
if [ -f /usr/local/bin/ws-ovpn ]; then rm -f /usr/local/bin/ws-ovpn; fi
if [ -f /etc/systemd/system/ws-dropbear.service ]; then rm -f /etc/systemd/system/ws-dropbear.service; fi
if [ -f /etc/systemd/system/ws-stunnel.service ]; then rm -f /etc/systemd/system/ws-stunnel.service; fi
if [ -f /etc/systemd/system/ws-ovpn.service ]; then rm -f /etc/systemd/system/ws-ovpn.service; fi
if [ -f /etc/systemd/system/sshws.service ]; then rm -f /etc/systemd/system/sshws.service; fi
if [ -f /usr/bin/proxy3.js ]; then rm -f /usr/bin/proxy3.js; fi

echo -e "${NC} Mendownload file yang dibutuhkan...!!"
cd
#   wget -O /usr/bin/proxy3.js "https://raw.githubusercontent.com/YaddyKakkoii/casper/main/proxy3.js"
wget -qO /usr/bin/proxy3.js ${REPO}proxy3.js
chmod +x /usr/bin/proxy3.js

#127.0.01 1194 2086 
# OVPN Over Websocket Python By YaddyKakkoii & Proxy For Edukasi & Imclass
wget -qO /usr/local/bin/ws-ovpn ${REPO}ws-ovpn.py
chmod +x /usr/local/bin/ws-ovpn
#   wget -O /usr/local/bin/ws-ovpn "https://raw.githubusercontent.com/YaddyKakkoii/casper/main/ws-ovpn.py"
# Installing Service
cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=VPN-Websocket By Yaddyganteng
Documentation=https://t.me/Crystalllz
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-ovpn
systemctl start ws-ovpn
systemctl restart ws-ovpn


echo -e "${NC} instalasi Service openvpn WEBSOCKET done ..!!"
sleep 2

wget -qO /usr/local/bin/ws-stunnel ${REPO}ws-stunnel.py
chmod +x /usr/local/bin/ws-stunnel

#127.0.0.1 69 700
# Installing Service SSH Over Websocket Python By YaddyKakkoii
cat > /etc/systemd/system/ws-stunnel.service << END
[Unit]
Description=SSH-Websocket By YaddyKakkoii
Documentation=https://t.me/Crystalllz
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-stunnel
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

echo -e "${NC} instalasi Service ssh WEBSOCKET done ..!!"
sleep 1
wget -qO /usr/local/bin/ws-dropbear ${REPO}ws-dropbear.py
chmod +x /usr/local/bin/ws-dropbear

#127.0.01 109 8443
# Installing Service DROPBEAR Over Websocket Python By YaddyKakkoii
cat > /etc/systemd/system/ws-dropbear.service << END
[Unit]
Description=DROPBEAR-Websocket By YaddyKakkoii
Documentation=https://t.me/Crystalllz
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-dropbear 2095
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

echo -e "${NC} instalasi Service dropbear WEBSOCKET done ..!!"
sleep 1
#127.0.0.1 22 8880 2082
wget -qO /usr/local/bin/ws-openssh ${REPO}ws-openssh.py
chmod +x /usr/local/bin/ws-openssh

# Installing Service OPENSSH Over Websocket Python By YaddyKakkoii

# Installing Service
cat > /etc/systemd/system/ws-openssh.service << END
[Unit]
Description=OPENSSH-Websocket By YaddyKakkoii
Documentation=https://t.me/Crystalllz
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-openssh 8080
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-openssh.service
systemctl start ws-openssh.service
systemctl restart ws-openssh.service

echo -e "${NC} instalasi Service openssh WEBSOCKET done ..!!"
sleep 1
#sed -i "/SSH Websocket/c\   - SSH Websocket           : $portsshws [ON]" /root/log-install.txt

wget -qO /usr/bin/ssh-wsenabler ${REPO}ssh-wsenabler
chmod +x /usr/bin/ssh-wsenabler
cat <<EOF > /etc/systemd/system/sshws.service
[Unit]
Description=WSenabler By YaddyKakkoii
Documentation=https://t.me/Crystalllz

[Service]
Type=simple
ExecStart=/usr/bin/ssh-wsenabler
KillMode=process
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
EOF
chmod +x /etc/systemd/system/sshws.service
systemctl daemon-reload
systemctl enable sshws.service
systemctl start sshws.service
systemctl restart sshws.service
#    service sshws restart
echo ""
echo -e "$COLOR1 ${NC}  ${WH}[${COLOR1}INFO${WH}]${NC} ${COLOR1}•${NC} ${green}SSH Websocket Started${NC}"
echo -e "==============================="
echo -e "Done Install Ssh & Ovpn Websocket"
echo -e "==============================="
echo -e "PORT SSH STUNNEL : 8080"
echo -e "PORT DROPBEAR STUNNEL   : 2095"
echo -e "PORT OVPN STUNNEL  : 2086"
echo -e "==============================="
echo ""
sleep 1
yellow "SSH WEBSOCKET TELAH AKTIF...!!"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• YADDY KAKKOII MAGELANG •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "${NC}SSH WEBSOCKET TELAH AKTIF...!!"

sleep 3