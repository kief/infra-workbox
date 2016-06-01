# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define 'infrawork' do |infrawork|

    infrawork.vm.box = 'kief/infra-workbox'
    infrawork.vm.hostname = 'infrawork'

    infrawork.ssh.username = 'vagrant'
    infrawork.ssh.password = 'vagrant'
    infrawork.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

    infrawork.vm.synced_folder '.', '/vagrant', disabled: false
    infrawork.vm.synced_folder '..', '/home/vagrant/projects', disabled: false

    infrawork.vm.provision 'shell', path: 'vagrant-scripts/setup-ssh.sh'
    infrawork.vm.provision 'shell', path: 'vagrant-scripts/setup-aws.sh'

    infrawork.vm.provider 'virtualbox' do |vb|
      vb.name = 'infrawork'
      vb.cpus = 1
      vb.memory = 1024
      # vb.gui = true
    end

  end

end
