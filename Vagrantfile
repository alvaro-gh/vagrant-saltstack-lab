# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "saltmaster" do |saltmaster|
    saltmaster.vm.box = "centos/7"
    saltmaster.vm.hostname = "salt-master"
    saltmaster.vm.network "private_network", ip: "192.168.0.10", virtualbox__intnet: true
    saltmaster.vm.provision "shell", inline: "/bin/bash /vagrant/init.sh"
  end

  config.vm.define "saltminion" do |saltminion|
    saltminion.vm.box = "centos/7"
    saltminion.vm.hostname = "saltminion"
    saltminion.vm.network "private_network", ip: "192.168.0.20", virtualbox__intnet: true
    saltminion.vm.provision "shell", inline: "/bin/bash /vagrant/init.sh"
  end
end
