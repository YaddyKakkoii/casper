#!/bin/bash
clear
#Decrypted By YADDY D PHREAKER
cd /root
rm -rf /etc/casper > /dev/null 2>&1
mkdir -p /etc/casper
mkdir -p /etc/casper/theme
cat <<EOF>> /etc/casper/theme/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
cat <<EOF>> /etc/casper/theme/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
cat <<EOF>> /etc/casper/theme/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
cat <<EOF>> /etc/casper/theme/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
cat <<EOF>> /etc/casper/theme/magenta
BG : \E[40;1;45m
TEXT : \033[0;35m
EOF
cat <<EOF>> /etc/casper/theme/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
cat <<EOF>> /etc/casper/theme/lightgray
BG : \E[40;1;47m
TEXT : \033[0;37m
EOF
cat <<EOF>> /etc/casper/theme/darkgray
BG : \E[40;1;100m
TEXT : \033[0;90m
EOF
cat <<EOF>> /etc/casper/theme/lightred
BG : \E[40;1;101m
TEXT : \033[0;91m
EOF
cat <<EOF>> /etc/casper/theme/lightgreen
BG : \E[40;1;102m
TEXT : \033[0;92m
EOF
cat <<EOF>> /etc/casper/theme/lightyellow
BG : \E[40;1;103m
TEXT : \033[0;93m
EOF
cat <<EOF>> /etc/casper/theme/lightblue
BG : \E[40;1;104m
TEXT : \033[0;94m
EOF
cat <<EOF>> /etc/casper/theme/lightmagenta
BG : \E[40;1;105m
TEXT : \033[0;95m
EOF
cat <<EOF>> /etc/casper/theme/lightcyan
BG : \E[40;1;106m
TEXT : \033[0;96m
EOF
cat <<EOF>> /etc/casper/theme/color.conf
lightcyan
EOF
clear
#Decrypted By YADDY D PHREAKER
cd /root
rm -rf /etc/yaddykakkoii
mkdir -p /etc/yaddykakkoii
mkdir -p /etc/yaddykakkoii/theme
clear
rm -rf /etc/casper > /dev/null 2>&1
rm -rf /etc/yaddykakkoii > /dev/null 2>&1
REPO="https://raw.githubusercontent.com/YaddyKakkoii/casper/main/"
wget -qO /etc/casper.zip "${REPO}casper.zip"
chmod +x /etc/casper.zip
cd /etc
unzip casper.zip
rm casper.zip
clear
cd /root
