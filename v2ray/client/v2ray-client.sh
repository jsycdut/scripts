#!/bin/bash

BASE_DIR=`pwd`
pm=""

command -v apt > /dev/null 2 >& 1 && pm="apt"
command -v yum > /dev/null 2 >& 1 && pm="yum"
command -v pacman > /dev/null 2 >& 1 && pm="pacman"

if [[ `id -u` != 0 ]]; then
  echo "This script needed to be executed as root"
  exit -1
fi

if [[ $pm == "pacman" ]]; then
  $pm -S v2ray
else
  $pm install v2ray -y
fi

cp `command -v  v2ray` /usr/bin
cp `command -v v2rayctl` /usr/bin

mkdir /etc/v2ray

# TODO use sed to write config.json

cp $BASE_DIR/config.json /etc/v2ray
cp $BASE_DIR/v2ray-client.service /lib/systemd/system

systemctl enable v2ray-client.service
systemctl start v2ray-client.service

echo "Done."
