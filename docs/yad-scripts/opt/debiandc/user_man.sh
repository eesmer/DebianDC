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

  sel_user=${CHOICE%%|*}

  if [[ -z "$sel_user" || "$sel_user" == "(none)" ]]; then
    "$YAD_BIN" $YAD_WIN --info --title="User Management" --text="No action selected" --button=gtk-ok:0 --fixed
    continue
  fi

  case "$sel_user" in
    "Create User")                       script="create_user" ;;
    "Delete User")                       script="delete_user" ;;
    "Disable User")                      script="disable_user" ;;
    "Enable User")                       script="enable_user" ;;
    "Set Expiry")                        script="set_expiry" ;;
    "Set No Expiry")                     script="set_no_expiry" ;;
    "Change Password")                   script="change_password" ;;
    "Change Password at Next Logon")     script="change_password_next_logon" ;;
    "User List")                         script="user_list" ;;
    *)                                   script="" ;;
  esac

  if [[ -n "$script" && -f "./$script" ]]; then
    bash "./$script"
  else
    "$YAD_BIN" $YAD_WIN --error --title="User Management" \
      --text="Script Not Found:\n<b>$script</b>" \
      --button=gtk-ok:0 --borders=8 --fixed
  fi
done

