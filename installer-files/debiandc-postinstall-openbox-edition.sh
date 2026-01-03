#!/bin/bash

apt-get -y install git
apt-get -y install openssh-server chrony
apt-get -y install dnsutils net-tools
apt-get -y install curl wget
apt-get -y install ack expect #krb5-user krb5-config
apt-get -y install syslog-ng #for auth.log
apt-get -y install openbox
apt-get -y install tmux vim htop
apt-get -y install xdg-utils xorg dbus-x11 x11-xserver-utils xserver-xorg-input-libinput
apt-get -y install slim netsurf-gtk zenity xterm xrdp
#apt-get -y install ansible

# -----------------------------------------------------------------------------
# APPLICATION INSTALL & CONFIG
# -----------------------------------------------------------------------------
git clone https://github.com/eesmer/DebianDC.git
cp -R DebianDC/debiandc/ /usr/local/ && cp DebianDC/README.md /usr/local/debiandc/
chown -R root:root /usr/local/debiandc
chmod -R 744 /usr/local/debiandc
chmod +x /usr/local/debiandc/manager
#cp /usr/local/debiandc/manager /usr/sbin/
#chmod 755 /usr/sbin/manager
#chmod +x /usr/sbin/manager

cp -r /usr/share/slim/themes/desktop-slim-theme /usr/share/slim/themes/debiandc
cp DebianDC/Documentation/assets/branding/DebianDC-LoginScreenImage.png /usr/share/slim/themes/debiandc/background.jpg && chmod 644 /usr/share/slim/themes/debiandc/background.jpg
rm -rf DebianDC

cat > /etc/slim.conf << EOF
# DebianDC - SLiM Login Manager Configuration
# This file is managed by DebianDC installer.
# Manual changes may be overwritten.
current_theme       debiandc
login_cmd           exec openbox-session
sessions            openbox
allowed_users       root
fail_delay          3
welcome_msg         DebianDC - Authorized Access Only (%host %domain)
shutdown_msg        DebianDC - The system is halting...
reboot_msg          DebianDC - The system is rebooting...
lockfile            /run/slim.pid
logfile             /var/log/slim.log
EOF
chmod 644 /etc/slim.conf

mkdir -p /root/.config/openbox
cp /etc/xdg/openbox/{rc.xml,autostart} /root/.config/openbox/

cat > /root/.config/openbox/autostart << EOF
#!/bin/sh
exec >> "$HOME/.openbox-autostart.log" 2>&1
echo "=== AUTOSTART $(date) ==="
xsetroot -solid "#1e1e1e" || true
if command -v dbus-launch >/dev/null 2>&1; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi
sleep 1
/usr/local/debiandc/manager &
EOF
chmod +x /root/.config/openbox/autostart 

cat > /root/.config/openbox/menu.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<openbox_menu xmlns="http://openbox.org/3.4/menu">
        <menu id="root-menu" label="DebianDC">
        <item label="Open DebianDC Manager">
        <action name="Execute">
        <command>/usr/local/debiandc/manager</command>
        </action>
        </item>
	<item label="Restart DebianDC Manager">
        <action name="Execute">
        <command>/usr/local/bin/debiandc-console-restart.sh</command>
        </action>
        </item>
	<separator/>
	<item label="Reload Openbox">
        <action name="Reconfigure"/>
        </item>
	<item label="Logout">
        <action name="Exit"/>
        </item>
        </menu>
EOF
