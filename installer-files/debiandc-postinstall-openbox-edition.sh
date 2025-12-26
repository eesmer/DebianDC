#!/bin/bash

apt-get -y install git
apt-get -y install zenity
apt-get -y install openssh-server chrony ntpdate # - ntp (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1033088)
apt-get -y install dnsutils net-tools
apt-get -y install curl wget
apt-get -y install ack expect krb5-user krb5-config
apt-get -y install tmux vim htop
apt-get -y install ansible
apt-get -y install syslog-ng #for auth.log
apt-get -y install xrdp
apt-get -y install --no-install-recommends xorg openbox dbus-x11 x11-xserver-utils xterm zenity yad
apt-get -y install --no-install-recommends lightdm lightdm-gtk-greeter
apt-get -y install netsurf-gtk xdg-utils
systemctl enable lightdm

# -----------------------------------------------------------------------------
# APPLICATION INSTALL & CONFIG
# -----------------------------------------------------------------------------
git clone https://github.com/eesmer/DebianDC.git
cp -R DebianDC/debiandc/ /usr/local/ && cp DebianDC/README.md /usr/local/debiandc/ && rm -r DebianDC
chown -R root:root /usr/local/debiandc
chmod -R 744 /usr/local/debiandc
chmod +x /usr/local/debiandc/manager
#cp /usr/local/debiandc/manager /usr/sbin/
#chmod 755 /usr/sbin/manager
#chmod +x /usr/sbin/manager

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
#/usr/local/bin/debiandc-console.sh &
/usr/local/debiandc/manager &
EOF

cat > /root/.config/openbox/menu.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<openbox_menu xmlns="http://openbox.org/3.4/menu">
        <menu id="root-menu" label="DebianDC">
        <item label="Open DebianDC Manager">
        <action name="Execute">
        <command>/usr/local/debiandc/manager</command>
        </action>
        </item>
	<item label="Restart DebianDC Manager Screen">
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
