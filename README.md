# infra-workbox builder

Builds a Vagrant box that can be used to work on infrastructure. It's intended to be useful for experimentation and also in a course/classroom environment. The tools are pre-installed in the Vagrant box, so people using it can simply use the box in their Vagrant configuration, without needing to download and install everything over the network.

The tooling includes Terraform, Packer, and the awscli client (with more to come as needed). The intention is to support working with AWS infrastructure.


# Using the box

Assuming someone else has built the box, you need to install it into your local boxes:

    vagrant box add infrawork <path-to>/infra-workbox.box

Then you can refer to the box in your Vagrantfile:

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



# Building the box

Make sure you have VirtualBox, Vagrant, and Packer installed. Then run:

    ./build.sh

This not only builds the box, it also installs it to your local Vagrant boxes. You can try out your box by running:

    vagrant up
    vagrant ssh


# TODO

Put the box somewhere public.


