#!/bin/bash

set -u
set -x

sed -i '/^PermitRootLogin yes/d' /etc/ssh/sshd_config

