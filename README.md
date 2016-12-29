# WARNING!

This code is intended as an example that you can copy and use, rather than a supported module that you should import. I reserve the right to completely change it in dangerous and destructive ways, with complete disregard for backwards compatibility.

Also, I make no guarantees that this code works as you find it. There's a pretty good chance that it's broken. It could be in the middle of a change, using it in some way specific to myself, I may neglect it, or for some other reason.


# What this is

This is a Packer project that builds a Vagrant box with various tools installed on it for working with infrastructure. The idea is that you have a Vagrantfile that uses this box, so you can work on a project without having to download the various bits. You can also destroy and rebuild your box at will - this is [infrastructure as code](http://infrastructure-as-code.com) for your local working environment!

I publish builds of the box on Atlas as `kief/infra-workbox`. Feel free to use this, keeping in mind that I'm not guaranteeing it's usable, or consistent from one version to the next.

I mainly use this box to work on Terraform projects with AWS, but I've installed a few other tools as well. The tooling includes Terraform, Packer, Docker, and the awscli client. You can see what's installed on the box by looking at the scripts in [packer-scripts](packer-scripts). 

You may want to fork this project, or copy it, and tweak it for your own needs. The files aren't necessarily parameterized - some things are hard-coded for building `kief/infra-workbox`.


# Using the workbox

The recommended use is to create a Vagrantfile and refer to the box built by this project:

```
Vagrant.configure(2) do |config|
  config.vm.define 'infrawork' do |infrawork|
    infrawork.vm.box = 'kief/infra-workbox'
    infrawork.vm.hostname = 'infrawork'
    infrawork.ssh.username = 'vagrant'
    infrawork.ssh.password = 'vagrant'
    infrawork.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
    infrawork.vm.synced_folder '.', '/vagrant', disabled: false
  end
end
```

Assuming you have [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed, start the VM:

```
vagrant up
vagrant ssh
```


## Automatically configure AWS

One of the hassles of working with AWS is setting up credentials. I automate this so that every time I build or rebuild my workbox, the credentials are immediately in place.

The way I do this is to have Vagrant run a provisioning script. This is in my Vagrantfile:

```
    infrawork.vm.provision 'shell', path: 'vagrant-scripts/setup-aws.sh'
```

You can see my [setup-aws.sh](vagrant-scripts/setup-aws.sh) script:

```
if [ ! -f /home/vagrant/projects/.secrets/aws_credentials ] ; then
  echo "ERROR: Can't find ../.secrets/aws_credentials. Check the README for instructions."
  exit 1
fi

cp /home/vagrant/projects/.secrets/aws_credentials /home/vagrant/.aws/credentials
chown -R vagrant:vagrant /home/vagrant/.aws
chmod 0600 /home/vagrant/.aws/credentials
```

This assumes that there is a folder named `.secrets` in the parent folder. My typical project structure is:

```
./project-parent/
./project-parent/.secrets/
./project-parent/.secrets/aws_credentials
./project-parent/vagrant/
./project-parent/vagrant/Vagrantfile
./project-parent/some-project/
```

Then I add a folder mount to my Vagrantfile:

```
    infrawork.vm.synced_folder '..', '/home/vagrant/project', disabled: false
```

This makes the parent folder, and whatever projects I have checked out there, available within the VM under `~/project/`.

If you've already created the vagrant VM instance when you add the credentials file in this way, you'll need to run:

```
vagrant provision
```

... or:

```
vagrant reload --provision
```


# Building your own version of the box

By default, the box is built and uploaded to Atlas when changes are committed to my github project. If you want to build your own version, without uploading it to Atlas, you can run the makefile (NOTE: This may not work without fiddling, since it's not my current use case).

Assuming you have GNU Make installed, run:

```
make
```

This will run [Packer](https://atlas.hashicorp.com/packer) (which must be installed and in your path) to build the box and install it locally as `infra-workbox`. In order to use this in your Vagrantfile, configure it instead of `kief/infra-workbox`:

```
    infrawork.vm.box = "infra-workbox"
```

