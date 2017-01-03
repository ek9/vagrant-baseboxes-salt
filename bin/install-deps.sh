#!/usr/bin/env bash
set -e

if [ -f 'bin/packer' ]; then
    echo "Packer is already installed!"
    exit 0
fi

echo "Installing packer to bin/packer"
wget -O packer.zip https://releases.hashicorp.com/packer/0.10.2/packer_0.10.2_linux_amd64.zip
unzip packer.zip -d bin/
rm packer.zip
