#!/bin/sh

set -e
set -x
curl -o /tmp/bootstrap-salt.sh -L https://bootstrap.saltstack.com
sudo sh /tmp/bootstrap-salt.sh
