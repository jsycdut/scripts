#!/bin/bash

BASE_DIR=`pwd`

if [[ `id -u` != 0 ]]; then
  echo "This script needed to be executed as root"
  exit -1
fi

command -v unzip > /dev/null 2>&1
if [[ $? != 0 ]]; then
  echo "unzip: command not found, PLEASE install unzip first."
  exit -1
fi

curl -Lo v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v4.20.0/v2ray-linux-64.zip

mkdir /v2ray && unzip v2ray.zip -d /v2ray

mkdir /etc/v2ray

# TODO use sed to write config.json

cp $BASE_DIR/config.json /etc/v2ray
cp $BASE_DIR/v2ray-client.service /lib/systemd/system

systemctl enable v2ray-client.service
systemctl start v2ray-client.service

echo "Done."
