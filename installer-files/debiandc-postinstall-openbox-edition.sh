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
