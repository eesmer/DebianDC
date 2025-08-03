#!/bin/bash

cd /opt/debiandc
source common-value

ICON_SETUP="preferences-system"
ICON_AD="network-workgroup"

ADPORT1=""
ADPORT2=""
command -v samba-tool >/dev/null || ADPORT1="NOK"
netstat -tulanp | grep -qw "tcp.*636" && ADPORT1="OK"
netstat -tulanp | grep -qw "tcp.*389" && ADPORT2="OK"

if [[ "$ADPORT1" != "OK" || "$ADPORT2" != "OK" ]]; then

  CHOICE=$(yad $YAD_OPTS --list \
    --separator="" \
    --title="DebianDC Installation Menu" \
    --window-icon=$ICON_SETUP \
    --center \
    --text="<b>Active Directory Installer</b>\nPlease Select an Action:" \
    --column="Action" \
    "Show IP Address" \
    "Set Static IP Address" \
    "Install a New Domain" \
    "Join to Existing Domain" \
    --separator="" \
    --button="gtk-ok:0" \
    --button="gtk-quit:1")

  echo "Seçilen: [$CHOICE]"

  [[ $? -ne 0 || -z "$CHOICE" ]] && exit

  case "$CHOICE" in
    "Show IP Address") bash show_ip_address;;
    "Set Static IP Address") bash set_static_ip ;;
    "Install a New Domain") lxterminal --title="DebianDC AD Install" --geometry=500x500 -e bash -lc '/opt/debiandc/install_ad' ;;
    "Join to Existing Domain") bash join_ad ;;
  esac
 
else
  DOMAIN_NAME=$(samba-tool domain info 127.0.0.1 | grep Domain | cut -d ':' -f2 | awk '{print toupper($1)}')
  HNAME=$(hostname -f)

  sed -i '/^$/d' common-value
  sed -i '/DOMAIN/d' common-value
  sed -i '/HNAME/d' common-value
  echo "DOMAIN=$DOMAIN_NAME" >> common-value
  echo "HNAME=$HNAME" >> common-value
  source common-value

  #bash service_check

  CHOICE=$(yad $YAD_OPTS --list \
    --separator="" \
    --title="DebianDC Management Panel" \
    --window-icon=$ICON_AD \
    --center \
    --text="<b>$DOMAIN_NAME Domain Environment</b>\nPlease Select an Action:" \
    --column="Manage Menu" \
    "User Management" \
    "Group Management" \
    "OU Management" \
    "Computer Management" \
    "DNS Management" \
    "Domain Operations" \
    "AD Settings" \
    "Maintenance" \
    "Reports" \
    --separator="" \
    --button="gtk-ok:0" \
    --button="gtk-quit:1")

  [[ $? -ne 0 || -z "$CHOICE" ]] && exit

  case "$CHOICE" in
    "User Management") bash user_man ;;
    "Group Management") bash group_man ;;
    "OU Management") bash ou_man ;;
    "Computer Management") bash computer_man ;;
    "DNS Management") bash dns_man ;;
    "Domain Operations") bash operations_domain ;;
    "AD Settings") bash settings ;;
    "Maintenance") bash maintenance ;;
    "Reports") bash reports ;;
  esac
fi
