#!/bin/bash
set -euo pipefail

ADDRESS="http://www.esmerkan.com/debiandc"

STATUS="/run/debiandc-postinstall.status"
echo "starting" > "$STATUS"
trap 'echo "DebianDC PostInstall failed. See log line for error." > "$STATUS"' ERR

LOG="/var/log/debiandc-postinstall.log"
exec > >(tee -a "$LOG") 2>&1

echo "=== DebianDC PostInstall Started: $(date -Is) ==="
echo "Phase:1 - DebianDC-PostInstall Running.." > "$STATUS"

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true
export NEEDRESTART_MODE=a

APT_OPTS=(
  -y
  -o Dpkg::Use-Pty=0
  -o DPkg::Lock::Timeout=600
  -o DPkg::Options::=--force-confdef
  -o DPkg::Options::=--force-confold
  -o Acquire::Retries=5
  -o Acquire::http::Timeout=20
  -o Acquire::https::Timeout=20
)

echo "Phase:2 - Update is being applied" > "$STATUS"
apt-get "${APT_OPTS[@]}" update

echo "Phase:3 - Installing DebianDC Environment Applications" > "$STATUS"
apt-get "${APT_OPTS[@]}" install \
  slim openbox zenity netsurf-gtk xrdp \
  xdg-utils xorg dbus-x11 x11-xserver-utils xserver-xorg-input-libinput \
  openssh-server xrdp \
  curl wget ca-certificates \
  dnsutils net-tools chrony \
  tmux vim htop xterm syslog-ng ack expect

echo "Phase:4 - Login configuration is being applied." > "$STATUS"

chmod +x /usr/local/debiandc/manager || true
cp -r /usr/share/slim/themes/desktop-slim-theme /usr/share/slim/themes/debiandc
cp /usr/local/debiandc/Documentation/assets/branding/DebianDC-LoginScreenImage.png /usr/share/slim/themes/debiandc/background.jpg && chmod 644 /usr/share/slim/themes/debiandc/background.jpg

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

echo "Phase:5 - Autostart and Desktop Menu settings for the environment are being configured." > "$STATUS"

cat > /root/.config/openbox/autostart << EOF
#!/bin/sh
exec >> "/root/.openbox-autostart.log" 2>&1
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
<!-- System submenu -->
 <menu id="system-menu" label="System Tools">
 <item label="Disk Usage">
 <action name="Execute">
 <command>xterm -geometry 120x35+300+200 -e bash -lc 'df -h; echo; read -n1 -p "Press any key..."'</command>
 </action>
 </item>
 <item label="Network Status">
 <action name="Execute">
 <command>x-terminal-emulator -geometry 120x35+300+200 -e bash -lc 'ip a; echo; read -n1 -p "Press any key..."'</command>
 </action>
 </item>
 <item label="System Update">
 <action name="Execute">
 <command>x-terminal-emulator -geometry 120x35+300+200 -e bash -lc 'apt update &amp;&amp; apt upgrade; echo; read -n1 -p "Press any key..."'</command>
 </action>
 </item>
 </menu>
<separator/>
<item label="About DebianDC">
<action name="Execute">
<command>xmessage -center -button "OK" "DebianDC Trixie -- https://github.com/eesmer/DebianDC"</command>
</action>
</item>
<item label="Build Info">
<action name="Execute">
<command>xmessage -center -button "OK" -file "/usr/local/debiandc/build_info.env"</command>
</action>
</item>
<separator/>
<item label="Logout">
<action name="Exit"/>
</item>
<item label="Restart">
<action name="Execute">
<command>/sbin/reboot</command>
</action>
</item>
<separator/>
<item label="Poweroff">
<action name="Execute">
<command>/sbin/poweroff</command>
</action>
</item>
</menu>
</openbox_menu>
EOF

echo "Phase:6 - Remote access settings are being configured" > "$STATUS"
# -----------------------------------------------------------------------------
# XRDP settings
# -----------------------------------------------------------------------------
wget -O /etc/xrdp/km-0000041f.ini $ADDRESS/install/configs/km-0000041f.ini
if [ -f /etc/xrdp/km-0000041f.ini ]; then
	chmod 644 /etc/xrdp/km-0000041f.ini
fi
#wget -O /ect/xrdp/xrdp_keyboard.ini $ADDRESS/install/configs/xrdp_keyboard.ini
#if [ -f /etc/xrdp/xrdp_keyboard.ini ]; then
#	chmod 644 /etc/xrdp/xrdp_keyboard.ini
#fi

# -----------------------------------------------------------------------------
# SSH settings
# -----------------------------------------------------------------------------
#echo "PermitRootLogin yes" > /etc/ssh/sshd_config.d/debiandc
#chmod 644 /etc/ssh/sshd_config.d/debiandc

touch /var/lib/debiandc-postinstall.done

echo "=== DebianDC postinstall SUCCESS: $(date -Is) ==="

echo "Phase:7 - Console info is being added and installation services are being disabled." > "$STATUS"

# -----------------------------
# DebianDC MOTD (console login info)
# -----------------------------
mkdir -p /etc/debiandc

INSTALL_INFO="/etc/debiandc/install-info.conf"
cat > "$INSTALL_INFO" <<EOF
DEBIANDC_INSTALLED=1
DEBIANDC_INSTALL_DATE="$(date -Is)"
DEBIANDC_VERSION="runtime-iso"
DEBIANDC_FIRSTBOOT_SERVICE="debiandc-postinstall.service"
EOF

MOTD_LINE_1="DebianDC: System is ready.."
MOTD_LINE_2="Install Date: $(date -Is)"
MOTD_LINE_3="Log: /var/log/debiandc-postinstall.log"

if [ -d /etc/motd.d ]; then
  cat > /etc/motd.d/99-debiandc <<EOF
============================================================
$MOTD_LINE_1
$MOTD_LINE_2
$MOTD_LINE_3
============================================================
EOF
chmod 0644 /etc/motd.d/99-debiandc
fi

systemctl disable debiandc-postinstall.service || true
systemctl disable debiandc-postinstall-ui.service || true
systemctl daemon-reload || true

echo "DebianDC-PostInstall successfully finished - The system will reboot automatically." > "$STATUS"

