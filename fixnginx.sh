#!/bin/bash
function 3xpurge(){
        apt-get -y remove nginx*
        apt-get -y --purge remove nginx*
        apt-get purge nginx -y
        apt-get purge nginx nginx-common nginx-core -y
        apt-get -y remove --purge nginx nginx-common nginx-core -y
        sudo apt-get remove --purge nginx -y
        sudo apt-get remove --purge nginx-common -y
        apt-get clean all && apt update -y
        sudo apt-get clean
        sudo apt-get autoclean
        sudo apt-get autoremove -y
        apt -y remove nginx*
        apt -y --purge remove nginx*
        apt purge nginx -y
        apt purge nginx nginx-common nginx-core -y
        apt -y remove --purge nginx nginx-common nginx-core -y
        sudo apt remove --purge nginx -y
        sudo apt remove --purge nginx-common -y
        apt clean all && apt update -y
        sudo apt clean
        sudo apt autoclean
        sudo apt autoremove -y
}
3xpurge
3xpurge
3xpurge
        rm -f /etc/apt/sources.list.d/nginx.list
        apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring
        curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
        echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
        http://nginx.org/packages/debian $(lsb_release -cs) nginx" | tee /etc/apt/sources.list.d/nginx.list
        echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" | tee /etc/apt/preferences.d/99nginx
        apt update -y && apt install -y nginx
systemctl stop nginx
systemctl stop sslh
rm -f /etc/nginx/nginx.conf
rm -f /etc/nginx/conf.d/*.conf
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/YaddyKakkoii/casper/main/nginx.conf" && chmod 777 /etc/nginx/nginx.conf
wget -qO /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/YaddyKakkoii/casper/main/vps.conf"
chmod 777 /etc/nginx/conf.d/vps.conf
wget -qO /etc/nginx/conf.d/xray.conf "https://raw.githubusercontent.com/YaddyKakkoii/casper/main/xray.conf"
chmod 777 /etc/nginx/conf.d/xray.conf
sed -i "s/yaddyganteng/${domainn}/g" /etc/nginx/conf.d/xray.conf
mkdir -p /etc/systemd/system/nginx.service.d && printf "[Service]\nExecStartPost=/bin/sleep 0.1\n" > /etc/systemd/system/nginx.service.d/override.conf
systemctl daemon-reload
systemctl restart nginx
systemctl restart sslh



forubuntu(){
function 3xpurge(){
        apt-get -y remove nginx*
        apt-get -y --purge remove nginx*
        apt-get purge nginx -y
        apt-get purge nginx nginx-common nginx-core -y
        apt-get -y remove --purge nginx nginx-common nginx-core -y
        sudo apt-get remove --purge nginx -y
        sudo apt-get remove --purge nginx-common -y
        apt-get clean all && apt update -y
        sudo apt-get clean
        sudo apt-get autoclean
        sudo apt-get autoremove -y
        apt -y remove nginx*
        apt -y --purge remove nginx*
        apt purge nginx -y
        apt purge nginx nginx-common nginx-core -y
        apt -y remove --purge nginx nginx-common nginx-core -y
        sudo apt remove --purge nginx -y
        sudo apt remove --purge nginx-common -y
        apt clean all && apt update -y
        sudo apt clean
        sudo apt autoclean
        sudo apt autoremove -y
}
3xpurge
3xpurge
3xpurge
        rm -f /etc/apt/sources.list.d/nginx.list
        sudo apt-get install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring
        curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
        echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
        http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" | tee /etc/apt/sources.list.d/nginx.list
        echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" | tee /etc/apt/preferences.d/99nginx
        apt-get update -y && sudo apt-get install -y nginx
systemctl stop nginx
systemctl stop sslh
rm -f /etc/nginx/nginx.conf
rm -f /etc/nginx/conf.d/*.conf
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/YaddyKakkoii/casper/main/nginx.conf" && chmod 777 /etc/nginx/nginx.conf
wget -qO /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/YaddyKakkoii/casper/main/vps.conf"
chmod 777 /etc/nginx/conf.d/vps.conf
wget -qO /etc/nginx/conf.d/xray.conf "https://raw.githubusercontent.com/YaddyKakkoii/casper/main/xray.conf"
chmod 777 /etc/nginx/conf.d/xray.conf
sed -i "s/yaddyganteng/${domainn}/g" /etc/nginx/conf.d/xray.conf
mkdir -p /etc/systemd/system/nginx.service.d && printf "[Service]\nExecStartPost=/bin/sleep 0.1\n" > /etc/systemd/system/nginx.service.d/override.conf
systemctl daemon-reload
systemctl restart nginx
systemctl restart sslh
}
