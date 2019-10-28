#!/bin/bash -e

# This script is for installing v2ray in linux server side

# Exit code
NOT_SYSTEMCTL=1
NOT_ROOT=2

BASE_DIR=$(pwd)

ARCH=$(uname -m)
GO_AMD64=https://storage.googleapis.com/golang/go1.12.4.linux-amd64.tar.gz
GO_X86=https://storage.googleapis.com/golang/go1.12.4.linux-386.tar.gz

## systemctl check
if ! `command -v systemctl > /dev/null 2>&1`; then
  echo "Non-Systemctl System Not Supported, Gonna Quit... "
  exit $NOT_SYSTEMCTL
fi

## root privilege check
if [[ `id -u` != 0 ]]; then
  echo "Run as root, Please"
  exit $NOT_ROOT
fi

## Arch check
echo "=====================Downloading Essential Files================="

V2RAY_HOME=/v2ray
mkdir -p $V2RAY_HOME/config

case $ARCH in
  x86_64)
    curl -o $V2RAY_HOME/go.tar.gz $GO_AMD64
    ;;
  *)
    curl -o $V2RAY_HOME/go.tar.gz $GO_X86
    ;;
esac

cd $V2RAY_HOME
tar -xf go.tar.gz

export PATH=$PATH:$V2RAY_HOME/go/bin
export GOPATH=$V2RAY_HOME

echo "=======================   Building v2ray   ====================="
echo "Getting v2ray source files..."
go get -u v2ray.com/core/...

echo "Building v2ray..."
go build -o $V2RAY_HOME/bin/v2ray v2ray.com/core/main
echo "Building v2ray finished: $V2RAY_HOME/bin/v2ray"

echo "Building v2ctl..."
go build -o $V2RAY_HOME/bin/v2ctl v2ray.com/core/infra/control/main
echo "Building v2ctl finished: $V2RAY_HOME/bin/v2ctl"

echo "=======================  Configuring v2ray ====================="
cp $BASE_DIR/config.json $V2RAY_HOME/config
cp $BASE_DIR/v2ray-server.service /lib/systemd/system

cp `find $GOPATH -name 'geoip.dat'` $V2RAY_HOME/bin
cp `find $GOPATH -name 'geosite.dat'` $V2RAY_HOME/bin

# TODO: BBR probe and apply

systemctl enable v2ray-server.service
# Start v2ray
systemctl start v2ray-server.service

echo "Finished, go to $V2RAY_HOME/config/config.json for your v2ray configuration details, see you"
