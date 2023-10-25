#!/bin/bash
clear
apt-get install ruby -y
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
rm -f master.zip
cd /root/lolcat-master/bin
gem install lolcat
apt-get install figlet
sudo apt-get install figlet
cd /root
git clone https://github.com/busyloop/lolcat
cd /root/lolcat/bin && gem install lolcat
cd /root
git clone https://github.com/xero/figlet-fonts
mv /root/figlet-fonts/* /usr/share/figlet/
cd /root
rm /root/figlet-fonts > /dev/null 2>&1
rm -fr /root/figlet-fonts
rm -rf /root/figlet-fonts
cd /root
rm -f lolcat.sh
