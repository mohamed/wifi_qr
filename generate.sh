#!/usr/bin/env sh

set -e

print_help() {
  echo "Usgae: $0 <SSID>"
  echo " where <SSID> is the name of your WiFi network"
  exit 1
}

if [ $# -ne 1 ]; then
  print_help
fi

if [ -z "$1" ]; then
  print_help
fi

SSID=$1

echo "Your network SSID is: ${SSID}"
echo "Generating password using pwgen..."
PASSWORD=$(pwgen -1 -s 63)
echo "Generated password is: ${PASSWORD}"

qrencode -o wifi.png "WIFI:T:WPA2;S:${SSID};P:${PASSWORD};;"

echo "QR code saved to wifi.png"
