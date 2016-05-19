# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "alpine" do |alpine|

    alpine.vm.box = "maier/alpine-3.3.1-x86_64"

    #alpine.ssh.username = "vagrant"
    #alpine.ssh.password = "vagrant"

    # Requires the vagrant-alpine plugin
    # TODO: Check for the plugin
    alpine.vm.network "private_network", ip: "172.28.128.250"
    alpine.vm.synced_folder ".", "/vagrant", type: "nfs"

    alpine.vm.provider "virtualbox" do |vb|
      vb.name = 'infrawork'
      vb.cpus = 1
      vb.memory = 1024
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      # vb.gui = true
    end
  end

end
