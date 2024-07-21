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
rm -rf /root/lolcat-master/
git clone https://github.com/busyloop/lolcat
cd /root/lolcat/bin && gem install lolcat
cd /root
rm -rf /root/lolcat/
git clone https://github.com/xero/figlet-fonts
mv -rf /root/figlet-fonts/* /usr/share/figlet/
cd /root
rm -rf /root/figlet-fonts
rm -fr /root/figlet-fonts
cd /root
rm -f lolcat.sh
