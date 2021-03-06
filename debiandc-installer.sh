#!/bin/bash

# -----------------------------------------------------------------------------
# STANDART PACKAGES
# -----------------------------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive
apt-get -y update && apt-get -y upgrade && apt-get -y autoremove

apt-get -y install git
apt-get -y install zenity
apt-get -y install openssh-server ntp
apt-get -y install tmux vim
apt-get -y install dnsutils net-tools
apt-get -y install curl wget
apt-get -y install ack expect krb5-user
apt-get -y install htop

# -----------------------------------------------------------------------------
# SERVER CONFIG
# -----------------------------------------------------------------------------
sed -i "12a# DebianDC Config" /etc/ssh/sshd_config
sed -i "13aPort 40022" /etc/ssh/sshd_config
sed -i "14aPermitRootLogin yes" /etc/ssh/sshd_config
systemctl restart ssh.service

# -----------------------------------------------------------------------------
# APPLICATION INSTALL & CONFIG
# -----------------------------------------------------------------------------
git clone https://github.com/eesmer/DebianDC.git

cp -R DebianDC/debiandc/ /usr/local/ && cp DebianDC/README.md /usr/local/debiandc/ && rm -r DebianDC
chown -R root:root /usr/local/debiandc
chmod -R 744 /usr/local/debiandc
chmod +x /usr/local/debiandc/manager
cp /usr/local/debiandc/manager /usr/sbin/
chmod 755 /usr/sbin/manager
chmod +x /usr/sbin/manager

# -----------------------------------------------------------------------------
# DESKTOP ENV: INSTALL
# -----------------------------------------------------------------------------
apt-get -y install screenfetch
DESKTOPCHECK=FALSE
screenfetch |grep DE: > /tmp/desktop_info && DESKTOPCHECK=TRUE

if [ "$DESKTOPCHECK" = "FALSE" ]; then
apt-get -y install lxde-core

mkdir -p /etc/skel/.local/share/applications
cat > /etc/skel/.local/share/applications/DebianDC-Manager.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=DebianDC-Manager
Terminal=false
Comment=Active Directory Manager
Categories=IDE
Icon=/usr/share/icons/gnome/48x48/actions/stock_up.png
Exec=bash /usr/local/debiandc/manager
EOF

mkdir -p /root/Desktop/DebianDC
cp /etc/skel/.local/share/applications/DebianDC-Manager.desktop /root/Desktop/DebianDC/
chmod +x /root/Desktop/DebianDC/DebianDC-Manager.desktop

mkdir -p /root/.local/share/applications/
cp /etc/skel/.local/share/applications/DebianDC-Manager.desktop /root/.local/share/applications/
chmod +x /root/.local/share/applications/DebianDC-Manager.desktop

# -----------------------------------------------------------------------------
# DebianDC IMAGE,LOGO
# ----------------------------------------------------------------------------
ADDRESS="http://www.esmerkan.com/debiandc"
wget -O /usr/share/lxde/images/logout-banner.png $ADDRESS/images/logout-banner.png
wget -O /usr/share/lxde/images/lxde-icon.png $ADDRESS/images/DebianDC-icon.png

echo "####################################"
echo "# DebianDC installation completed. #"
echo "####################################"
sleep 1
reboot
fi
