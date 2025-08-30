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

