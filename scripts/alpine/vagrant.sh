#!/bin/sh

set -e
set -x

date | sudo tee /etc/vagrant_box_build_time

mkdir -p /home/vagrant/.ssh
curl -fsSLo /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 700 /home/vagrant/.ssh/
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
