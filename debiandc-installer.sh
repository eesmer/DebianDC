#!/bin/bash

# -----------------------------------------------------------------------------
# STANDART PACKAGES
# -----------------------------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive
apt-get -y install git
apt-get -y install zenity
apt-get -y install openssh-server ntp
apt-get -y install tmux vim
apt-get -y install dnsutils net-tools
apt-get -y install curl wget
apt-get -y install expect krb5-user
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
