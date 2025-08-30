#!/bin/bash
set -e
set -o pipefail

cd /opt/debiandc || exit 1
source common-value

#[ -f comman_value ] && source comman_value
: "${YAD_BIN:=yad}"
#: "${YAD_WIN:=--center --geometry=900x600}"

#if ! command -v "$YAD_BIN" >/dev/null 2>&1; then
#  echo "[ERR] 'yad' not installed" >&2
#  exit 1
#fi

while true; do
  CHOICE=$(
    "$YAD_BIN" $YAD_WIN \
      --form \
      --title="User and Computer Management" \
      --window-icon=preferences-system \
      --text="<b>User Management</b> select an action" \
      --borders=10 \
      --separator="|" \
      --field="User Management:CB" "Create User!Delete User!Disable User!Enable User!Set Expiry!Set No Expiry!Change Password!Change Password at Next Logon!User List" \
      --button="Back:2" --button="Run:0" --button="gtk-close:1"
  )

  status=$?
  case $status in
    1) exit 0 ;; # Kapat
    2) # Back (if exist MAIN not exist manager)
       if [[ -n "$MAIN" && -f "$MAIN" ]]; then
         bash "$MAIN"
       else
         bash manager
       fi
       exit $? ;;
  esac

