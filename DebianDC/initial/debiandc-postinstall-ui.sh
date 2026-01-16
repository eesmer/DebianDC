#!/bin/bash
set -euo pipefail

source /usr/local/debiandc/build_info.env
LOG="/var/log/debiandc-postinstall.log"
STATUS="/run/debiandc-postinstall.status"
DONE="/var/lib/debiandc-postinstall.done"

exec </dev/tty1 >/dev/tty1 2>/dev/tty1
stty -F /dev/tty1 sane || true

spinner='|/-\'
i=0

while true; do
  clear
  cat /usr/local/debiandc/Documentation/assets/branding/DebianDC-banner.txt
  echo ""
  echo "============================================================="
  echo "DebianDC - Initial Setup Settings and Configurations"
  echo "============================================================="
  echo
  echo "-------------------------------------------------------------"
  echo "Please wait.."
  echo "Do not TURN OFF or RESTART the computer."
  echo "Initial setup settings are being configured."
  echo "Once the installation is complete, the system will automatically restart and DebianDC will be ready for use."
  echo "-------------------------------------------------------------"
  echo "Make sure you're using the latest version for new features and fixes."
  echo "-------------------------------------------------------------"
  echo "Build           : 2026.01.16"
  echo "Latest Download : https://sourceforge.net/projects/debiandc/files/latest/download"
  echo "Latest Download : https://esmerkan.com/debiandc/download/latest"
  echo "Release Notes   : https://github.com/eesmer/DebianDC/blob/master/Release_Notes.md"
  echo "Documentation   : https://github.com/eesmer/DebianDC/tree/master/Documentation"
  echo "-------------------------------------------------------------"
  echo

  state="(The situation is being checked)"
  if [ -f "$STATUS" ]; then
    state="$(cat "$STATUS" 2>/dev/null || true)"
  fi
  echo "STATUS: $state  ${spinner:i%4:1}"
  echo

  if [ -f "$LOG" ]; then
    echo "---- First Install and Configuration Logs----"
    tail -n 18 "$LOG" 2>/dev/null || true
  else
    echo "Log generation is expected..."
  fi

  if [ -f "$DONE" ]; then
    echo
    echo "Installation complete"
    echo "The system will be restart"
    sleep 2
    /usr/bin/systemctl reboot
    exit 0
  fi

  sleep 1
  i=$((i+1))
done

