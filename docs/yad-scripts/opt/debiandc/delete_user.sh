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

username=$( \
  "$YAD_BIN" $YAD_WIN \
  --form \
  --geometry=500x200 \
  --columns=1 \
  --field="Username:ENTRY" "" \
  --button="Cancel:1" --button="Delete:0" \
)

username="${username%%|}"

status=$?
[[ $status -ne 0 ]] && exit 0

if [[ -z "$username" ]]; then
  "$YAD_BIN" $YAD_WIN --error --text="Username field cannot be empty" --button=gtk-ok:0
  exit 1
fi

echo "Username deleting: $username"
samba-tool user delete "$username"

"$YAD_BIN" $YAD_WIN --info --text="User <b>$username</b> successfully deleted" --button=gtk-ok:0

