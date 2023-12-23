#!/bin/bash

ADDRESS="http://www.esmerkan.com/debiandc"
export DEBIAN_FRONTEND=noninteractive
echo "DebianDC post-install is running..."

# -----------------------------------------------------------------------------
# INSTALL DESKTOP Env.
# -----------------------------------------------------------------------------
apt-get -y update && apt-get -y upgrade && apt-get -y autoremove
apt-get install -y lxde-core
#apt-get install -y mate-desktop-environment-core #FOR MATE DESKTOP
apt-get install -y lightdm
apt-get autoremove -y && apt-get -y autoclean

# -----------------------------------------------------------------------------
# DebianDC IMAGE,LOGO,GRUB
# -----------------------------------------------------------------------------
sed -i '50aOS="DebianDC"' /etc/grub.d/10_linux
update-grub
wget -O /usr/share/lxde/images/logout-banner.png $ADDRESS/images/logout-banner.png
wget -O /usr/share/lxde/images/lxde-icon.png $ADDRESS/images/DebianDC-icon.png

# -----------------------------------------------------------------------------
# DEBIANDC INSTALL
# -----------------------------------------------------------------------------
wget https://raw.githubusercontent.com/eesmer/DebianDC/master/debiandc-installer.sh -O /tmp/debiandc-installer.sh
bash /tmp/debiandc-installer.sh

# editor
update-alternatives --set editor /usr/bin/vim.basic

# -----------------------------------------------------------------------------
# DebianDC-Setup Menu - settings of /etc/skel directory
# -----------------------------------------------------------------------------
mkdir -p /etc/skel/.local/share/applications
cat > /etc/skel/.local/share/applications/DebianDC-ADManager.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=DebianDC - AD Manager
Terminal=false
Comment=Active Directory Manager
Categories=IDE
Icon=/usr/share/icons/gnome/48x48/actions/stock_up.png
Exec=bash /usr/local/debiandc/manager
EOF
cat > /etc/skel/.local/share/applications/DebianDC-Utility.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=DebianDC - Utility
Terminal=false
Comment=Active Directory Environment Utility Tools
Categories=IDE
Icon=/usr/share/icons/gnome/48x48/actions/stock_up.png
Exec=bash /usr/local/debiandc/utility
EOF
cat > /etc/skel/.local/share/applications/DebianDC-WindowsManager.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=DebianDC - Windows Manager
Terminal=false
Comment=Windows Host Manager
Categories=IDE
Icon=/usr/share/icons/gnome/48x48/actions/stock_up.png
Exec=bash /usr/local/debiandc/ansible/manage_windows_host
EOF

mkdir -p /root/Desktop/DebianDC
cp /etc/skel/.local/share/applications/DebianDC-ADManager.desktop /root/Desktop/DebianDC/
cp /etc/skel/.local/share/applications/DebianDC-Utility.desktop /root/Desktop/DebianDC/
cp /etc/skel/.local/share/applications/DebianDC-WindowsManager.desktop /root/Desktop/DebianDC/
chmod +x /root/Desktop/DebianDC/DebianDC-ADManager.desktop
chmod +x /root/Desktop/DebianDC/DebianDC-Utility.desktop
chmod +x /root/Desktop/DebianDC/DebianDC-WindowsManager.desktop

mkdir -p /root/.local/share/applications/
cp /etc/skel/.local/share/applications/DebianDC-ADManager.desktop /root/.local/share/applications/
cp /etc/skel/.local/share/applications/DebianDC-Utility.desktop /root/.local/share/applications/
cp /etc/skel/.local/share/applications/DebianDC-WindowsManager.desktop /root/Desktop/DebianDC/
chmod +x /root/.local/share/applications/DebianDC-ADManager.desktop
chmod +x /root/.local/share/applications/DebianDC-Utility.desktop
chmod +x /root/Desktop/DebianDC/DebianDC-WindowsManager.desktop

# Desktop Menu - removed menus
rm /usr/share/applications/gcr-prompter.desktop
rm /usr/share/applications/gcr-viewer.desktop
rm /usr/share/applications/lxde-screenlock.desktop
rm /usr/share/applications/lxrandr.desktop
rm /usr/share/applications/lxsession-default-apps.desktop
rm /usr/share/applications/mimeinfo.cache
rm /usr/share/applications/notification-daemon.desktop
rm /usr/share/applications/obconf.desktop
rm /usr/share/applications/openbox.desktop
rm /usr/share/applications/org.gnome.Screenshot.desktop
rm /usr/share/applications/pavucontrol.desktop
rm /usr/share/applications/python3.11.desktop
rm /usr/share/applications/screensavers
rm /usr/share/applications/vim.desktop
rm /usr/share/applications/xdg-desktop-portal-gtk.desktop
rm /usr/share/applications/xscreensaver-settings.desktop

echo "post-install finished"
echo "Please reboot the machine"
