#!/bin/bash

HOSTIP=$(hostname -I)

#------------------
# Color Codes
#------------------
MAGENTA="tput setaf 1"
GREEN="tput setaf 2"
YELLOW="tput setaf 3"
DGREEN="tput setaf 4"
CYAN="tput setaf 6"
WHITE="tput setaf 7"
GRAY="tput setaf 8"
RED="tput setaf 9"
NOCOL="tput sgr0"

# -----------------------------------------------------------------------------
# STANDART PACKAGES
# -----------------------------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive

## apt-get -y purge systemd-timesyncd #systemd-timesyncd Conflicts time-daemon # will be tested again
apt-get -y update && apt-get -y upgrade && apt-get -y autoremove

apt-get -y install git
apt-get -y install zenity
apt-get -y install openssh-server chrony ntpdate # - ntp (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1033088)
apt-get -y install tmux vim
apt-get -y install dnsutils net-tools
apt-get -y install curl wget
apt-get -y install ack expect krb5-user krb5-config
apt-get -y install htop
apt-get -y install ansible
apt-get -y install syslog-ng #for auth.log
apt-get -y install xrdp #settings not completed

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
XDIR=FALSE
[ -d "/usr/share/xsessions/" ] && XDIR=TRUE
ps -e | grep -E -i "xfce|kde|gnome|lxde|cinnamon" && XDIR=TRUE
NEW_DESKTOP="NO"

if [ "$XDIR" = "FALSE" ]; then
	apt-get -y install lxde-core
	NEW_DESKTOP="YES(LXDE-Core)"
    #mkdir -p /etc/skel/.local/share/applications

# -----------------------------------------------------------------------------
# DebianDC IMAGE,LOGO
# ----------------------------------------------------------------------------
ADDRESS="http://www.esmerkan.com/debiandc"
sed -i '50aOS="DebianDC"' /etc/grub.d/10_linux
update-grub
wget -O /usr/share/lxde/images/logout-banner.png $ADDRESS/images/logout-banner.png
wget -O /usr/share/lxde/images/lxde-icon.png $ADDRESS/images/DebianDC-icon.png
fi

mkdir -p /etc/skel/.local/share/applications
cat > /etc/skel/.local/share/applications/DebianDC-ADManager.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=DebianDC - ADManager
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
Exec=bash /usr/local/debiandc/ansible/windows_manager
EOF
cat > /etc/skel/.local/share/applications/DebianDC-ChangeToAdministratorPassword.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=DebianDC - Administrator Password Changer
Terminal=false
Comment=Administrator Password Changer
Categories=IDE
Icon=/usr/share/icons/gnome/48x48/actions/stock_up.png
Exec=bash /usr/local/debiandc/administrator_changepass
EOF

mkdir -p /root/Desktop/DebianDC
cp /etc/skel/.local/share/applications/DebianDC-ADManager.desktop /root/Desktop/DebianDC/
cp /etc/skel/.local/share/applications/DebianDC-Utility.desktop /root/Desktop/DebianDC/
cp /etc/skel/.local/share/applications/DebianDC-WindowsManager.desktop /root/Desktop/DebianDC/
cp /etc/skel/.local/share/applications/DebianDC-ChangeToAdministratorPassword.desktop /root/Desktop/DebianDC/
chmod +x /root/Desktop/DebianDC/DebianDC-ADManager.desktop
chmod +x /root/Desktop/DebianDC/DebianDC-Utility.desktop
chmod +x /root/Desktop/DebianDC/DebianDC-WindowsManager.desktop

mkdir -p /root/.local/share/applications/
cp /etc/skel/.local/share/applications/DebianDC-ADManager.desktop /root/.local/share/applications/
cp /etc/skel/.local/share/applications/DebianDC-Utility.desktop /root/.local/share/applications/
cp /etc/skel/.local/share/applications/DebianDC-WindowsManager.desktop /root/.local/share/applications/
cp /etc/skel/.local/share/applications/DebianDC-ChangeToAdministratorPassword.desktop /root/.local/share/applications/

chmod +x /root/.local/share/applications/DebianDC-ADManager.desktop
chmod +x /root/.local/share/applications/DebianDC-Utility.desktop
chmod +x /root/Desktop/DebianDC/DebianDC-WindowsManager.desktop
chmod +x /root/Desktop/DebianDC/DebianDC-ChangeToAdministratorPassword.desktop

# -----------------------------------------------------------------------------
# Desktop Menu - removed menus
# -----------------------------------------------------------------------------
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

# -----------------------------------------------------------------------------
# xrdp settings
# -----------------------------------------------------------------------------
wget -O /etc/xrdp/km-0000041f.ini $ADDRESS/install/configs/km-0000041f.ini
wget -O /ect/xrdp/xrdp_keyboard.ini $ADDRESS/install/configs/xrdp_keyboard.ini
chmod 644 /etc/xrdp/km-0000041f.ini
chmod 644 /etc/xrdp/xrdp_keyboard.ini

echo -e

$CYAN
echo "------------------------------------"
echo "# DebianDC installation completed. #"
echo "------------------------------------"
echo -e
$YELLOW
echo "New Desktop Install        : $NEW_DESKTOP"
echo "Remote Access from Linux   : xfreerdp /w:1366 /h:768 /v:$HOSTIP:3389"
echo "Remote Access from Linux   : remmina, vinagre etc"
echo "Remote Access from Windows : RemoteDesktop : $HOSTIP"
echo -e
$WHITE
echo "User Guide                 : https://github.com/eesmer/DebianDC/blob/master/DebianDC-Handbook.md"
echo -e

sleep 1
reboot
