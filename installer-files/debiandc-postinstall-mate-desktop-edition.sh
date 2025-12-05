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

# Set NetworkManager
systemctl enable NetworkManager.service 2>/dev/null || true
systemctl start  NetworkManager.service 2>/dev/null || true

# -----------------------------------------------------------------------------
# MATE Panel Layout
# -----------------------------------------------------------------------------
mkdir -p /usr/share/debiandc/mate
cat >/usr/share/debiandc/mate/debiandc-mate-panel.conf <<'EOF'
[/]
object-id-list=['notification-area', 'clock', 'object-0', 'object-1']
toplevel-id-list=['top']

[objects/clock]
applet-iid='ClockAppletFactory::ClockApplet'
locked=true
object-type='applet'
panel-right-stick=true
position=0
toplevel-id='top'

[objects/clock/prefs]
custom-format=''
format='24-hour'

[objects/notification-area]
applet-iid='NotificationAreaAppletFactory::NotificationArea'
locked=true
object-type='applet'
panel-right-stick=true
position=10
toplevel-id='top'

[objects/object-0]
object-type='menu'
panel-right-stick=false
position=0
tooltip='Compact Menu'
toplevel-id='top'
use-menu-path=false

[objects/object-1]
applet-iid='WnckletFactory::WindowListApplet'
object-type='applet'
panel-right-stick=false
position=34
toplevel-id='top'

[toplevels/top]
expand=true
orientation='bottom'
screen=0
size=24
y=775
y-bottom=0
EOF

