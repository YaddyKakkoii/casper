#!/bin/bash
rm -fr /etc/nginx/nginx.conf
rm -fr /etc/nginx/conf.d/xray.conf
rm -fr /etc/nginx/conf.d/vps.conf
rm /usr/local/etc/xray
rm -fr /etc/systemd/system/xray.service
rm -fr /etc/xray
systemctl disable nginx.service
systemctl stop nginx.service
/etc/init.d/nginx stop
systemctl disable xray
systemctl stop xray
systemctl disable nginx
systemctl stop nginx
systemctl stop runn
kill nginx.service
pkill nginx.service
kill xray
pkill xray.service
kill runn
pkill runn.service
apt purge xray -y
apt-get purge xray -y
apt-get -y remove xray*
apt-get -y --purge remove xray*
apt -y remove --purge xray
apt remove --purge xray -y
apt clean
apt autoclean
apt autoremove -y
apt purge nginx -y
apt purge nginx -y
apt-get purge nginx -y
apt purge nginx nginx-common nginx-core -y
apt-get purge nginx nginx-common nginx-core -y
apt -y remove --purge nginx nginx-common nginx-core -y
apt autoremove -y
apt-get -y remove nginx*
apt-get -y --purge remove nginx*
apt -y remove --purge nginx
sudo apt remove --purge nginx -y
sudo apt clean
sudo apt autoclean
sudo apt autoremove -y
sudo apt remove --purge nginx-common -y
sudo apt clean
sudo apt autoclean
sudo apt autoremove -y
#wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/fixnginxoff.sh; bash fixnginxoff.sh; rm fixnginxoff.sh

wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/ins-xray.sh; bash ins-xray.sh; rm ins-xray.sh
cd /root
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/fixtema.sh; bash fixtema.sh; rm fixtema.sh
cd /root
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/tools.sh; chmod +x tools.sh; bash tools.sh; rm tools.sh
clear
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/ohp.sh && chmod +x ohp.sh && ./ohp.sh
wget https://raw.githubusercontent.com/YaddyKakkoii/casper/main/insshws.sh && chmod +x insshws.sh && ./insshws.sh
