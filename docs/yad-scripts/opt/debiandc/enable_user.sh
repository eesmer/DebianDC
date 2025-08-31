#!/bin/bash
set -o pipefail

cd /opt/debiandc || exit 1
source common-value

: "${YAD_BIN:=yad}"
LOG_FILE="/tmp/$(basename "$0" .sh).log"

username=$(
  "$YAD_BIN" $YAD_WIN \
  --form \
  --geometry=500x200 \
  --columns=1 \
  --title="Enable User Account" \
  --window-icon=system-users \
  --text="<b>Enter the Username to be enabled</b>" \
  --field="Username:ENTRY" "" \
  --button="Cancel:1" --button="Enable:0"
)

status=$?
[[ $status -eq 1 ]] && bash user_man.sh && exit 0
[[ $status -ne 0 ]] && exit 0

username="${username%%|}"

if [[ -z "$username" ]]; then
  "$YAD_BIN" $YAD_WIN \
    --error \
    --text="Username field cannot be empty" \
    --button=gtk-ok:0
  bash enable_user.sh
  exit 1
fi

{ samba-tool user enable "$username" 2>&1 | tee "$LOG_FILE" ; } || true

"$YAD_BIN" --text-info --title="Result" $YAD_WIN \
  --button=gtk-ok:0 \
  --filename="$LOG_FILE"

bash user_man.sh

