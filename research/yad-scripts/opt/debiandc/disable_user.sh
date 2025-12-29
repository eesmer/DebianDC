#!/bin/bash
set -o pipefail

cd /opt/debiandc || exit 1
source common-value
LOG_FILE="/tmp/$(basename "$0" .sh).log"

#[ -f comman_value ] && source comman_value
: "${YAD_BIN:=yad}"
#: "${YAD_WIN:=--center --geometry=900x600}"

#if ! command -v "$YAD_BIN" >/dev/null 2>&1; then
#  echo "[ERR] 'yad' not installed" >&2
#  exit 1
#fi

username=$( \
  "$YAD_BIN" $YAD_WIN \
  --form \
  --geometry=500x200 \
  --columns=1 \
  --title="Disable User Account" \
  --window-icon=system-users \
  --text="<b>Enter the Username to be disable</b>" \
  --field="Username:ENTRY" "" \
  --button="Cancel:1" --button="Disable:0" \
)

status=$?
if [[ $status -eq 1 ]]; then
  bash user_man.sh
  exit 0
fi

username="${username%%|}"

if [[ -z "$username" ]]; then
  "$YAD_BIN" $YAD_WIN --error --text="Username field cannot empty" --button=gtk-ok:0
  bash disable_user.sh
fi

{ samba-tool user disable "$username" 2>&1 | tee $LOG_FILE ; } || true

"$YAD_BIN" --text-info --title="Result" $YAD_WIN --button=gtk-ok:0 --filename=$LOG_FILE

bash user_man.sh

