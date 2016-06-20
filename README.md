# infra-workbox builder

Provides a Vagrant box that can be used to work on infrastructure. It's intended to be useful for experimentation and also in a course/classroom environment. The tools are pre-installed in the Vagrant box, so people using it can simply use the box in their Vagrant configuration, without needing to download and install everything over the network.

The tooling includes Terraform, Packer, and the awscli client (with more to come as needed). The intention is to support working with AWS infrastructure.


# Using the workbox

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

By default, the box is built and uploaded to Atlas when changes are committed to my github project. If you want to build your own version, without uploading it to Atlas, you can run the build script (NOTE: This may not work without fiddling, since it's not my current use case).

        ./build.sh

This will run Packer (which must be in your path) to build the box and install it locally as ++infra-workbox++. This isn't how the Vagrantfile looks for the box, so you'll need to modify your Vagrantfile to match:

        infrawork.vm.box = "infra-workbox"


If you want to use an Atlas account, make a file ++../.secrets/packer-secrets.sh++, and put your ATLAS_TOKEN in it:

        export ATLAS_TOKEN="your-token-here"

The the ++build.sh++ script will use this.


## TODO

Make it simpler for people to build their own box, whether or not they want to upload it to Atlas.

