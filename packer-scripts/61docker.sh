set -x

# Remove outdated stuff if found
apt-get purge lxc-docker
apt-get remove -y docker docker-engine docker.io

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install -y docker-ce

usermod -aG docker vagrant
# sed -i -e 's/^GRUB_CMDLINE_LINUX=.*$/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/' /etc/default/grub
# update-grub

pip install docker-compose
