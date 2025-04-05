#!/bin/bash

RED='\033[0;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

AMNEZIAWG_DIR="/etc/amnezia/amneziawg"

if [[ -e /etc/apt/sources.list.d/ubuntu.sources ]]; then
        if ! grep -q "deb-src" /etc/apt/sources.list.d/ubuntu.sources; then
                cp /etc/apt/sources.list.d/ubuntu.sources /etc/apt/sources.list.d/amneziawg.sources
                sed -i 's/deb/deb-src/' /etc/apt/sources.list.d/amneziawg.sources
        fi
else
        if ! grep -q "^deb-src" /etc/apt/sources.list; then
                cp /etc/apt/sources.list /etc/apt/sources.list.d/amneziawg.sources.list
                sed -i 's/^deb/deb-src/' /etc/apt/sources.list.d/amneziawg.sources.list
        fi
fi
apt install -y software-properties-common
add-apt-repository -y ppa:amnezia/ppa
apt install -y amneziawg amneziawg-tools qrencode
