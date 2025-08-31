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

