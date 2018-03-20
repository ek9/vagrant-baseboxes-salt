#!/bin/sh

set -e
set -x

sudo tee -a /etc/apk/repositories <<EOF

http://dl-cdn.alpinelinux.org/alpine/v3.7/community
EOF

sudo apk update
sudo apk add libgit2
sudo apk add salt-minion
