if [ -d /etc/yaddykakkoii ]; then rm -rf /etc/yaddykakkoii; fi
mkdir -p /etc/yaddykakkoii
mkdir -p /etc/yaddykakkoii/theme
#THEME RED
cat <<EOF>> /etc/yaddykakkoii/theme/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
#THEME BLUE
cat <<EOF>> /etc/yaddykakkoii/theme/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
#THEME GREEN
cat <<EOF>> /etc/yaddykakkoii/theme/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
#THEME YELLOW
cat <<EOF>> /etc/yaddykakkoii/theme/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
#THEME MAGENTA
cat <<EOF>> /etc/yaddykakkoii/theme/magenta
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
#THEME CYAN
cat <<EOF>> /etc/yaddykakkoii/theme/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
#TEMA LIGHT AMBIL DARI CASPER
cat <<EOF>> /etc/yaddykakkoii/theme/lightgray
BG : \E[40;1;47m
TEXT : \033[0;37m
EOF
cat <<EOF>> /etc/yaddykakkoii/theme/darkgray
BG : \E[40;1;100m
TEXT : \033[0;90m
EOF
cat <<EOF>> /etc/yaddykakkoii/theme/lightred
BG : \E[40;1;101m
TEXT : \033[0;91m
EOF
cat <<EOF>> /etc/yaddykakkoii/theme/lightgreen
BG : \E[40;1;102m
TEXT : \033[0;92m
EOF
cat <<EOF>> /etc/yaddykakkoii/theme/lightyellow
BG : \E[40;1;103m
TEXT : \033[0;93m
EOF
cat <<EOF>> /etc/yaddykakkoii/theme/lightblue
BG : \E[40;1;104m
TEXT : \033[0;94m
EOF
cat <<EOF>> /etc/yaddykakkoii/theme/lightmagenta
BG : \E[40;1;105m
TEXT : \033[0;95m
EOF
cat <<EOF>> /etc/yaddykakkoii/theme/lightcyan
BG : \E[40;1;106m
TEXT : \033[0;96m
EOF
#THEME CONFIG
cat <<EOF>> /etc/yaddykakkoii/theme/color.conf
blue
EOF
