#!/bin/bash
apt-get install -y --no-install-recommends xorg openbox dbus-x11 x11-xserver-utils zenity yad

cat > /root/.config/openbox/autostart << EOF
exec >> "$HOME/.openbox-autostart.log" 2>&1
echo "=== AUTOSTART $(date) ==="
xsetroot -solid "#1e1e1e" || true
EOF
