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
apt-get -y install ack expect krb5-user
apt-get -y install htop

# -----------------------------------------------------------------------------
# APPLICATION INSTALL & CONFIG
# -----------------------------------------------------------------------------
git clone https://github.com/eesmer/DebianDC.git

cp -R DebianDC/debiandc/ /usr/local/ && cp DebianDC/README.md /usr/local/debiandc/ && rm -r DebianDC
chown -R root:root /usr/local/debiandc
chmod -R 744 /usr/local/debiandc
chmod +x /usr/local/debiandc/mainmenu
chmod +x /usr/local/debiandc/manager
cp /usr/local/debiandc/mainmenu /usr/sbin/
cp /usr/local/debiandc/manager /usr/sbin/
chmod 755 /usr/sbin/mainmenu
chmod 755 /usr/sbin/manager
chmod +x /usr/sbin/mainmenu
chmod +x /usr/sbin/manager
