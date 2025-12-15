#!/bin/bash
apt-get install -y --no-install-recommends xorg openbox dbus-x11 x11-xserver-utils zenity yad

cat > /root/.config/openbox/autostart << EOF
exec >> "$HOME/.openbox-autostart.log" 2>&1
echo "=== AUTOSTART $(date) ==="
xsetroot -solid "#1e1e1e" || true
if command -v dbus-launch >/dev/null 2>&1; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi
sleep 1
/usr/local/debiandc/manager &
EOF

cat > /root/.config/openbox/menu.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<openbox_menu xmlns="http://openbox.org/3.4/menu">
        <menu id="root-menu" label="DebianDC">
        <item label="Open DebianDC Console">
        <action name="Execute">
        <command>/usr/local/bin/manager.sh</command>
        </action>
        </item>
	<item label="Restart DebianDC Console">
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
