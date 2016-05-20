# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "infrawork" do |infrawork|

    infrawork.vm.box = "infra-workbox"

    infrawork.ssh.username = "vagrant"
    infrawork.ssh.password = "vagrant"

    infrawork.vm.synced_folder ".", "/vagrant", disabled: false

    infrawork.vm.provider "virtualbox" do |vb|
      vb.name = 'infrawork'
      vb.cpus = 1
      vb.memory = 1024
      # vb.gui = true
    end

  end

end
