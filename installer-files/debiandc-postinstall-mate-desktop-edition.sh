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

