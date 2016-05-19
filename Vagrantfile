# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "infrawork" do |infrawork|

    infrawork.vm.box = "infra-workbox"

    unless Vagrant.has_plugin?("vagrant-alpine")
      raise 'vagrant-alpine is not installed!'
    end

    if Vagrant.has_plugin?("vagrant-vbguest")
      config.vbguest.auto_update = false
    end

    infrawork.ssh.username = "vagrant"
    infrawork.ssh.password = "vagrant"

    infrawork.vm.network "private_network", ip: "172.28.128.250"
    infrawork.vm.synced_folder ".", "/vagrant", type: "nfs"

    infrawork.vm.provider "virtualbox" do |vb|
      vb.name = 'infrawork'
      vb.cpus = 1
      vb.memory = 1024
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      # vb.gui = true
    end
  end

end
