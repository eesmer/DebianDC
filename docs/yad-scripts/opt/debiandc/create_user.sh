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

FIELDS=$("$YAD_BIN" $YAD_WIN \
  --form \
  --title="Create New User" \
  --window-icon=system-users \
  --text="<b>Enter New User Information</b>" \
  --borders=10 \
  --separator="|" \
  --field="Username:ENTRY" \
  --field="Name Surname:ENTRY" \
  --field="Description(GECOS):ENTRY" \
  --field="Password":HIDDEN \
  --field="Password (Confirm)":HIDDEN \
  --button="Cancel:1" \
  --button="Create:0")

status=$?
[[ $status -ne 0 ]] && exit 0

username=$(cut -d"|" -f1 <<< "$FIELDS")
fullname=$(cut -d"|" -f2 <<< "$FIELDS")
gecos=$(cut -d"|" -f3 <<< "$FIELDS")
password1=$(cut -d"|" -f4 <<< "$FIELDS")
password2=$(cut -d"|" -f5 <<< "$FIELDS")

if [[ -z "$username" || -z "$fullname" || -z "$password1" || -z "$password2" ]]; then
  "$YAD_BIN" $YAD_WIN --error --text="You must fill in all fields" --button=gtk-ok:0
  exit 1
fi

if [[ "$password1" != "$password2" ]]; then
  "$YAD_BIN" $YAD_WIN --error --text="Passwords do not match" --button=gtk-ok:0
  exit 1
fi

echo "User creating..: $username ($fullname)"
samba-tool user create "$username" "$password1" --given-name="$fullname" --description="$gecos"

"$YAD_BIN" $YAD_WIN --info --text="User <b>$username</b> successfully created" --button=gtk-ok:0

