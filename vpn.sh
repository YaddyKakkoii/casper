#!/bin/bash
REPO="https://raw.githubusercontent.com/YaddyKakkoii/casper/main/"
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(curl -sS ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
#ANU=eth0
#ANU=$(ip -o $ANU -4 route show to default | awk '{print $5}');
#default via 159.223.48.1 dev eth0 onlink
apt install openvpn easy-rsa unzip -y
apt install openssl iptables iptables-persistent -y
mkdir -p /etc/openvpn/server/easy-rsa/
cd /etc/openvpn/
wget ${REPO}vpn.zip
unzip vpn.zip
rm -f vpn.zip
chown -R root:root /etc/openvpn/server/easy-rsa/
cd /root
mkdir -p /usr/lib/openvpn/
cp /usr/lib/x86_64-linux-gnu/openvpn/plugins/openvpn-plugin-auth-pam.so /usr/lib/openvpn/openvpn-plugin-auth-pam.so
sed -i 's/#AUTOSTART="all"/AUTOSTART="all"/g' /etc/default/openvpn
systemctl enable --now openvpn-server@server-tcp
systemctl enable --now openvpn-server@server-udp
/etc/init.d/openvpn restart
/etc/init.d/openvpn status
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
cat > /etc/openvpn/tcp.ovpn <<-END
client
dev tun
proto tcp
remote xxxxxxxxx 1194
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass pass.txt
comp-lzo
verb 3
END
sed -i $MYIP2 /etc/openvpn/tcp.ovpn;
cat > /etc/openvpn/udp.ovpn <<-END
client
dev tun
proto udp
remote xxxxxxxxx 2200
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass pass.txt
comp-lzo
verb 3
END
sed -i $MYIP2 /etc/openvpn/udp.ovpn;
cat > /etc/openvpn/ssl.ovpn <<-END
client
dev tun
proto tcp
remote xxxxxxxxx 990
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass pass.txt
comp-lzo
verb 3
END
sed -i $MYIP2 /etc/openvpn/ssl.ovpn;
cd /root
/etc/init.d/openvpn restart
echo '<ca>' >> /etc/openvpn/tcp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/tcp.ovpn
echo '</ca>' >> /etc/openvpn/tcp.ovpn
cp /etc/openvpn/tcp.ovpn /home/vps/public_html/tcp.ovpn
echo '<ca>' >> /etc/openvpn/udp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/udp.ovpn
echo '</ca>' >> /etc/openvpn/udp.ovpn
cp /etc/openvpn/udp.ovpn /home/vps/public_html/udp.ovpn
echo '<ca>' >> /etc/openvpn/ssl.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/ssl.ovpn
echo '</ca>' >> /etc/openvpn/ssl.ovpn
cp /etc/openvpn/ssl.ovpn /home/vps/public_html/ssl.ovpn


###### 1 TCP IP #####################

cat > /etc/openvpn/ip.tcp.ovpn <<END
############## WELCOME ###############
############# By Yaddykakkoii Magelang ##############
# Telegram : @Crystalllz
# Instagram : t.me/Crystalllz
# buatlah file pass.txt dalam folder yg sama dengan .ovpn
# format user password: line 1 user line 2 password
client
dev tun
proto tcp
remote xxxxxxxxx 1194
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass pass.txt
comp-lzo
verb 3

END
echo '<ca>' >> /etc/openvpn/ip.tcp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/ip.tcp.ovpn
echo '</ca>' >> /etc/openvpn/ip.tcp.ovpn
cp /etc/openvpn/ip.tcp.ovpn /home/vps/public_html/ip.tcp.ovpn
cp /etc/openvpn/ip.tcp.ovpn /var/www/html/ip.tcp.ovpn

sed -i $MYIP2 /etc/openvpn/ip.tcp.ovpn

###### 2 TCP POINTING #####################

cat > /etc/openvpn/pointing.tcp.ovpn <<END
############## WELCOME ###############
############# By Yaddykakkoii Magelang ##############
# Telegram : @Crystalllz
# Instagram : t.me/Crystalllz
# buatlah file pass.txt dalam folder yg sama dengan .ovpn
# format user password: line 1 user line 2 passwordpnlient
dev tun
proto tcp
remote $bugvidio.$domain 1194
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass pass.txt
comp-lzo
verb 3

END
echo '<ca>' >> /etc/openvpn/pointing.tcp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/pointing.tcp.ovpn
echo '</ca>' >> /etc/openvpn/pointing.tcp.ovpn
cp /etc/openvpn/pointing.tcp.ovpn /home/vps/public_html/pointing.tcp.ovpn
cp /etc/openvpn/pointing.tcp.ovpn /var/www/html/pointing.tcp.ovpn

###### 3 TCP DOMAIN #####################

cat > /etc/openvpn/domain.tcp.ovpn <<END
############## WELCOME ###############
############# By Yaddykakkoii Magelang ##############
# Telegram : @Crystalllz
# Instagram : t.me/Crystalllz
# buatlah file pass.txt dalam folder yg sama dengan .ovpn
# format user password: line 1 user line 2 password
client
dev tun
proto tcp
remote $domain 1194
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass pass.txt
comp-lzo
verb 3

END
echo '<ca>' >> /etc/openvpn/domain.tcp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/domain.tcp.ovpn
echo '</ca>' >> /etc/openvpn/domain.tcp.ovpn
cp /etc/openvpn/domain.tcp.ovpn /home/vps/public_html/domain.tcp.ovpn
cp /etc/openvpn/domain.tcp.ovpn /var/www/html/domain.tcp.ovpn

###### 4 POTATO UDP #####################

cat > /etc/openvpn/Potato-udp.ovpn <<END
############## WELCOME ###############
############# By Yaddykakkoii Magelang ##############
# Telegram : @Crystalllz
# Instagram : t.me/Crystalllz
# buatlah file pass.txt dalam folder yg sama dengan .ovpn
# format user password: line 1 user line 2 password
auth-user-pass pass.txt
client
dev tun
proto udp
remote $domain 2200
persist-key
persist-tun
pull
resolv-retry infinite
nobind
comp-lzo
remote-cert-tls server
verb 3
mute 2
connect-retry 5 5
connect-retry-max 8080
mute-replay-warnings
redirect-gateway def1
script-security 2
cipher none
auth none
END
echo '<ca>' >> /etc/openvpn/Potato-udp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/Potato-udp.ovpn
echo '</ca>' >> /etc/openvpn/Potato-udp.ovpn
cp /etc/openvpn/Potato-udp.ovpn /home/vps/public_html/Potato-udp.ovpn
cp /etc/openvpn/Potato-udp.ovpn /var/www/html/Potato-udp.ovpn

###### 5 POTATO NTLS #####################

cat > /etc/openvpn/Potato-ntls.ovpn <<END
auth-user-pass pass.txt
client
dev tun
proto tcp
remote $domain 80
persist-key
persist-tun
pull
resolv-retry infinite
nobind
comp-lzo
remote-cert-tls server
verb 3
mute 2
connect-retry 5 5
connect-retry-max 8080
mute-replay-warnings
redirect-gateway def1
script-security 2
cipher none
auth none
END
echo '<ca>' >> /etc/openvpn/Potato-ntls.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/Potato-ntls.ovpn
echo '</ca>' >> /etc/openvpn/Potato-ntls.ovpn
cp /etc/openvpn/Potato-ntls.ovpn /home/vps/public_html/Potato-ntls.ovpn
cp /etc/openvpn/Potato-ntls.ovpn /var/www/html/Potato-ntls.ovpn

###### 6 POTATO SSL #####################

cat > /etc/openvpn/Potato-ssl.ovpn <<END
auth-user-pass pass.txt
client
dev tun
proto tcp
remote $domain 443
persist-key
persist-tun
pull
resolv-retry infinite
nobind
comp-lzo
remote-cert-tls server
verb 3
mute 2
connect-retry 5 5
connect-retry-max 8080
mute-replay-warnings
redirect-gateway def1
script-security 2
cipher none
auth none
END
echo '<ca>' >> /etc/openvpn/Potato-ssl.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/Potato-ssl.ovpn
echo '</ca>' >> /etc/openvpn/Potato-ssl.ovpn
cp /etc/openvpn/Potato-ssl.ovpn /home/vps/public_html/Potato-ssl.ovpn
cp /etc/openvpn/Potato-ssl.ovpn /var/www/html/Potato-ssl.ovpn
#iptables -t nat -I POSTROUTING -s 10.7.0.0/24 -o $ANU -j MASQUERADE
iptables -t nat -I POSTROUTING -s 10.6.0.0/24 -o eth0 -j MASQUERADE
iptables -t nat -I POSTROUTING -s 10.7.0.0/24 -o eth0 -j MASQUERADE
iptables -t nat -I POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
iptables -t nat -I POSTROUTING -s 20.8.0.0/24 -o eth0 -j MASQUERADE
iptables-save > /etc/iptables.up.rules
chmod +x /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
systemctl enable openvpn
systemctl start openvpn
/etc/init.d/openvpn restart
history -c
rm -f /root/vpn.sh
MYIP=$(curl -sS ipv4.icanhazip.com);
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
echo ""
echo -e "Link Download OVPN tcp OHP : http://$MYIP:89/tcp-ohp.ovpn"
echo -e "Link Download OVPN potato modem : http://$MYIP:89/Potato-modem.ovpn"
echo -e "Link Download OVPN potato OHP : http://$MYIP:89/Potato-ohp.ovpn"
echo ""
echo -e "Yaddy Kakkoii Magelang"
echo ""
echo ""
sleep 3
