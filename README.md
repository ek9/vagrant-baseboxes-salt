# vagrant-baseboxes-salt

[![Travis](https://img.shields.io/travis/ek9/vagrant-baseboxes-salt.svg?style=flat-square)](https://travis-ci.org/ek9/vagrant-baseboxes-salt)

[Vagrant Baseboxes with SaltStack on Atlas][0]

This repository contains [packer][1] templates used to build [ek9 vagrant
baseboxes][0] with [SaltStack][2]. This is a customized and maintained fork of
[packer-templates by kaorimatz][3].

## Baseboxes

This is a list of built baseboxes:

    - [ek9/archlinux-salt-x86_64][10] - latest Arch Linux; SaltStack 2016.11.1.
    - [ek9/centos-7-salt-x86_64][11] - CentOS 7.3; SaltStack 2016.11.1
    - [ek9/debian-8-salt-amd64][12] - Debian 8.6; SaltStack 2016.11.1
    - [ek9/openbsd-6-salt-amd64][13] - OpenBSD 6.0; SaltStack 2016.3.1

## Usage

Quickly initialize and get basebox running with [Vagrant][4]:

### Arch Linux

    $ vagrant init ek9/archlinux-salt-x86_64
    $ vagrant up

### CentOS

    $ vagrant init ek9/centos-7-salt-x86_64
    $ vagrant up

### Debian

    $ vagrant init ek9/debian-8-salt-amd64
    $ vagrant up

### OpenBSD

    $ vagrant init ek9/openbsd-6-salt-amd64
    $ vagrant up

## Building

In order to manually build the boxes, clone this repository:

    $ git clone https://github.com/ek9/vagrant-baseboxes-salt && cd vagrant-baseboxes-salt

Build a machine image for virtualbox from the template in the repository:

    $ bin/packer build -var-file vars/release.json -only=virtualbox-iso template.json

Once the box is built you can add it to vagrant:

    $ vagrant box add custom-archlinux-x86_64 archlinux-x86_64-virtualbox.box

## Credits

Copyright (c) 2017 ek9. This work is licensed under [MIT LICENSE](LICENSE).

Original code from [kaorimatz/packer-templates][3] that is part of this
repository is Copyright (c) 2014 Satoshi Matsumoto.


[0]: https://atlas.hashicorp.com/ek9
[1]: https://www.packer.io
[2]: https://www.saltstack.com
[3]: https://github.com/kaorimatz/packer-templates
[4]: https://www.vagrantup.com
[10]: https://atlas.hashicorp.com/ek9/boxes/archlinux-salt-x86_64
[11]: https://atlas.hashicorp.com/ek9/boxes/centos-7-salt-x86_64
[12]: https://atlas.hashicorp.com/ek9/boxes/debian-8-salt-amd64
[13]: https://atlas.hashicorp.com/ek9/boxes/openbsd-6-salt-amd64


