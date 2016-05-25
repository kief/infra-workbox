# infra-workbox builder

Provides a Vagrant box that can be used to work on infrastructure. It's intended to be useful for experimentation and also in a course/classroom environment. The tools are pre-installed in the Vagrant box, so people using it can simply use the box in their Vagrant configuration, without needing to download and install everything over the network.

The tooling includes Terraform, Packer, and the awscli client (with more to come as needed). The intention is to support working with AWS infrastructure.


# Making the box available

The simplest case for using this workbox is to use one that someone else has built. This is the intended use case for coursework. If this is the case, install the box locally:

    vagrant box add infrawork <path-to>/infra-workbox.box


The more complex case is to build the box yourself. Follow the instructions below for "building the box", which will install the box locally for you.


# Using it

The recommended use case is to clone this project in a folder which has subfolders for each project that will use this box. The parent folder, where this infra-workbox project is cloned to, is referred to as the ++projects++ folder.

Make a folder to hold secrets in the projects folder:

    mkdir ../.secrets

Make an ssh key in the secrets folder:

    ssh-keygen -t rsa -C "infraworkbox@your.com" -f ../.secrets/infraworkbox_key -N ""

Make a file ../.secrets/aws_credentials with your AWS keys - the contents should be as below:

    [default]
    aws_access_key_id = ${AWS_ACCESS_KEY_ID}
    aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}


Then start your vagrant machine in the usual way, and ssh into it:

    vagrant up
    vagrant ssh

You should find the projects directory, the parent of this one, in ~/projects.


# Building the box

The simple case is to use a box that someone else, such as the course leader, has already built, so that everyone is working from consistent starting point. But if you're not using this box as part of a course, or if you're the one leading the course, you can build it following these instructions.

Make sure you have VirtualBox, Vagrant, and Packer installed. Then run:

    ./build.sh

This not only builds the box, it also installs it to your local Vagrant boxes. You can try out your box by running:

    vagrant up
    vagrant ssh


# TODO

Put the box somewhere public.


