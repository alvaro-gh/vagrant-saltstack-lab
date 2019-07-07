# SaltStack lab with Vagrant

This repository holds a [Vagrant](https://www.vagrantup.com) deploy of [SaltStack](https://www.saltstack.com). Two VMs are created, a Salt Master and a Salt Minion.

## Vagrant

You need to have [Vagrant](https://www.vagrantup.com) and [VirtualBox](https://www.vagrantup.com) installed. Included Vagrantfile is a multi-box deployment using [shell provisioning](https://www.vagrantup.com/docs/provisioning/shell.html).

## SaltStack

This deployment uses Salt preseeded keys, read more about it [here](https://docs.saltstack.com/en/latest/topics/tutorials/preseed_key.html).

## How-To

Shell provisioning must be run twice, once to disable SELINUX (a reboot is needed, this could be temprarily done too) and once to setup SaltStack.

Complete Steps:
```
$ git clone https://github.com/mxdlx/vagrant-saltstack-lab
$ cd vagrant-saltstack-lab
$ vagrant up

# Check if reboot is done and SELINUX is disabled:
$ vagrant ssh saltmaster -c getenforce
$ vagrant ssh saltminion -c getenforce

# If SELINUX is disabled, provision again:
$ vagrant up --provision

# Once provisioning is complete, enter Salt Master
$ vagrant ssh saltmaster

# Inside VM
$ sudo salt '*' test.ping
saltminion:
    True
```
