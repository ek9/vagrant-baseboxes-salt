#!/bin/sh

set -e
set -x

sudo tee -a /etc/apk/repositories <<EOF

https://dl-cdn.alpinelinux.org/alpine/edge/community
EOF

sudo apk update
sudo apk add salt-minion
