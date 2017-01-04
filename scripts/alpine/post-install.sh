#!/bin/sh

set -x

apk upgrade -U --available

source /etc/os-release

apk add curl bash sudo

adduser -D vagrant
echo "vagrant:vagrant" | chpasswd

cat <<EOF > /etc/sudoers.d/vagrant
Defaults:vagrant !requiretty
vagrant ALL=(ALL) NOPASSWD: ALL
EOF

chmod 440 /etc/sudoers.d/vagrant


