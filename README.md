# vagrant-baseboxes-salt

[![Travis](https://img.shields.io/travis/ek9/vagrant-baseboxes-salt.svg?style=flat-square)](https://travis-ci.org/ek9/vagrant-baseboxes-salt)

[Vagrant Baseboxes with SaltStack on Atlas][0]

This repository contains [packer][1] templates used to build [ek9 vagrant
baseboxes][0] with [SaltStack][2]. This is a customized and maintained fork of
[packer-templates by kaorimatz][3].

## Baseboxes

This is a list of built baseboxes:

- [ek9/alpine-3-salt-x86_64][14] - Alpine Linux 3.5.0; SaltStack 2016.11.1
- [ek9/archlinux-salt-x86_64][10] - latest Arch Linux; SaltStack 2016.11.1
- [ek9/centos-7-salt-x86_64][11] - CentOS 7.3; SaltStack 2016.11.1
- [ek9/debian-8-salt-amd64][12] - Debian 8.6; SaltStack 2016.11.1
- [ek9/openbsd-6-salt-amd64][13] - OpenBSD 6.0; SaltStack 2016.3.1

## Usage

Quickly initialize and get basebox running with [Vagrant][4]:

###  Alpine Linux

    $ vagrant init ek9/alpine-3-salt-x86_64
    $ vagrant up

#### Limitations

- VirtualBox Guest Modules are NOT compatible with [Alpine Linux][9]. To make
  various vagrant features work (i.e. private networking or synced folders) you
  are required to use [vagrant-alpine][23] plugin. To install the plugin,run:

        $ vagrant plugin install vagrant-alpine

- In order to use Synced Folders, you are required to use either NFS or rsync.
  Make sure [vagrant-alpine][23] plugin is installed if you plan to use NFS. To
  switch default `/vagrant` share to NFS, add this to `Vagrantfile`:

        config.vm.synced_folder ".", "/vagrant", type: "NFS"

  Alternatively, you can disable the default `/vagrant` share:

        config.vm.synced_folder ".", "/vagrant", disabled: true

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

To build a machine, you will have to pass template file to use to `packer build` command:

- `alpine-3-salt-x86_64.json` used to build [Alpine Linux][9] 3.5.0.
- `archlinux-x86_64.json` used to build [Arch Linux][5].
- `centos-7.3-x86_64.json` used to build [CentOS][6] 7.3
- `debian-8.6-amd64.json` used to build [Debian][7] 8.6
- `openbsd-6.0-amd64.json` used to build [OpenBSD][8] 6.0

When building, you can build a box for the following providers (via `-only=`
argument):

- `virtualbox-iso` used to build [VirtualBox][20] based images.
- `vmware-iso` used to build [VMWare based][21] images.
- `qemu` used to build [QEMU][22] based images.

Additionally, you can specify a variable file (via `-var-file file`) which can
be used to customize some of the build variables:

- `vars/release.json` - release specific variables
- `vars/development.json` - development specific variables (for testing)

To build a specific VM, use this command:

    $ bin/packer build -var-file vars/release.json -only=virtualbox-iso template.json

Once the box is built you will see a `.box` file in the main directory which
you can add to vagrant under `custom-name` and initialize:

    $ vagrant box add custom-name template.box
    $ vagrant init custom-name
    $ vagrant up

## Credits

Copyright (c) 2017 ek9. This work is licensed under [MIT LICENSE](LICENSE).

Original code from [kaorimatz/packer-templates][3] that is part of this
repository is Copyright (c) 2014 Satoshi Matsumoto.


[0]: https://atlas.hashicorp.com/ek9
[1]: https://www.packer.io
[2]: https://www.saltstack.com
[3]: https://github.com/kaorimatz/packer-templates
[4]: https://www.vagrantup.com
[5]: https://www.archlinux.org
[6]: https://www.centos.org
[7]: https://www.debian.org
[8]: https://www.openbsd.org
[9]: https://www.alpinelinux.org
[10]: https://atlas.hashicorp.com/ek9/boxes/archlinux-salt-x86_64
[11]: https://atlas.hashicorp.com/ek9/boxes/centos-7-salt-x86_64
[12]: https://atlas.hashicorp.com/ek9/boxes/debian-8-salt-amd64
[13]: https://atlas.hashicorp.com/ek9/boxes/openbsd-6-salt-amd64
[14]: https://atlas.hashicorp.com/ek9/boxes/alpine-3-salt-x86_64
[20]: https://www.virtualbox.org
[21]: https://www.vmware.com
[22]: http://wiki.qemu.org/Main_Page
[23]: https://github.com/maier/vagrant-alpine
