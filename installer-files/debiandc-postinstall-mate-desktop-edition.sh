#!/bin/bash

# DebianDC - Post Install Script

set -e
export DEBIAN_FRONTEND=noninteractive
ADDRESS="https://www.esmerkan.com/debiandc"

echo "--------------------------------------------------"
echo " DebianDC post-install is running (MATE Edition v2)"
echo "--------------------------------------------------"
sleep 2

export HOME="/root"

# -----------------------------------------------------------------------------
# Update/Upgrade
# -----------------------------------------------------------------------------
apt-get -y update
apt-get -y upgrade
apt-get -y autoremove

# -----------------------------------------------------------------------------
# Minimal MATE Desktop Install
# -----------------------------------------------------------------------------
apt-get install -y \
    xorg \
    mate-desktop-environment-core \
    mate-terminal \
    mate-panel \
    mate-session-manager \
    mate-settings-daemon \
    marco \
    caja caja-extensions-common \
    pluma \
    engrampa \
    network-manager-gnome \
    lightdm \
    slick-greeter \
    dconf-cli \
    policykit-1-gnome

# -----------------------------------------------------------------------------
# 3) LightDM and GUI Settings
# -----------------------------------------------------------------------------
if command -v debconf-set-selections >/dev/null 2>&1; then
    echo "lightdm shared/default-x-display-manager select lightdm" | debconf-set-selections
    dpkg-reconfigure -f noninteractive lightdm || true
fi

systemctl set-default graphical.target || true

