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

dconf load /org/mate/panel/ < /usr/share/debiandc/mate/debiandc-mate-panel.conf || true

# -----------------------------------------------------------------------------
# 5) DebianDC Logo & Logout Banner Add/Set
# -----------------------------------------------------------------------------
ICON_URL="${ADDRESS}/images/DebianDC-icon.png"

for SIZE in 24 32 48; do
    ICON_PATH="/usr/share/icons/mate/${SIZE}x${SIZE}/places"
    if [ -d "$ICON_PATH" ]; then
        wget -q -O "${ICON_PATH}/start-here-mate.png" "$ICON_URL" || true
    fi
done

if [ -d /usr/share/icons/mate ]; then
    gtk-update-icon-cache /usr/share/icons/mate || true
fi

BANNER_URL="${ADDRESS}/images/logout-banner.png"
BANNER_PATH="/usr/share/backgrounds/debiandc-logout-banner.png"

wget -q -O "$BANNER_PATH" "$BANNER_URL" || true

mkdir -p /etc/lightdm

cat >/etc/lightdm/slick-greeter.conf <<EOF
[Greeter]
background=${BANNER_PATH}
draw-grid=false
EOF

# -----------------------------------------------------------------------------
# 6) DebianDC Installer
# -----------------------------------------------------------------------------
TMP_INSTALLER="/tmp/debiandc-installer.sh"

if wget -q -O "$TMP_INSTALLER" "https://raw.githubusercontent.com/eesmer/DebianDC/master/debiandc-installer.sh"; then
    chmod +x "$TMP_INSTALLER"
    bash "$TMP_INSTALLER" || true
else
    echo "WARNING: debiandc-installer.sh could not be downloaded."
    echo "You can run it manually later if needed."
fi

echo "Cleaning up apt cache..."
apt-get autoremove -y
apt-get autoclean -y

echo "--------------------------------------------------"
echo " DebianDC post-install finished."
echo " You can reboot the machine"
echo "--------------------------------------------------"

