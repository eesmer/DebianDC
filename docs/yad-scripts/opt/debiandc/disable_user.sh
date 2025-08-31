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
  --title="Disable User Account" \
  --window-icon=system-users \
  --text="<b>Enter the Username to be disable</b>" \
  --field="Username:ENTRY" "" \
  --button="Cancel:1" --button="Disable:0" \
)

username="${username%%|}"

status=$?
[[ $status -ne 0 ]] && exit 0

if [[ -z "$username" ]]; then
  "$YAD_BIN" $YAD_WIN --error --text="Username field cannot empty" --button=gtk-ok:0
  exit 1
fi

{ samba-tool user disable "$username" 2>&1 | tee /tmp/disable_user.log ; } || true

"$YAD_BIN" --text-info --title="Result" $YAD_WIN --button=gtk-ok:0 --filename=/tmp/disable_user.log

bash user_man.sh

