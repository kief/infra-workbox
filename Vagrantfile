# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "infrawork" do |infrawork|

    infrawork.vm.box = "infra-workbox"

    infrawork.ssh.username = "vagrant"
    infrawork.ssh.password = "vagrant"

    # infrawork.vm.network "private_network", ip: "172.28.128.250"
    infrawork.vm.synced_folder ".", "/vagrant", disabled: false

    infrawork.vm.provider "virtualbox" do |vb|
      vb.name = 'infrawork'
      vb.cpus = 1
      vb.memory = 1024
      # vb.gui = true
    end

    config.vm.provision "shell", path: "scripts/10ruby.sh"
    config.vm.provision "shell", path: "scripts/20terraform.sh"
    config.vm.provision "shell", path: "scripts/21packer.sh"

  end

end
