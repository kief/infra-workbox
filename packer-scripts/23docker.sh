set -x

apt-get install -y linux-image-extra-$(uname -r) apparmor apt-transport-https ca-certificates

apt-get purge lxc-docker
# apt-cache policy docker-engine
apt-get install -y docker.io
usermod -aG docker vagrant
sed -i -e 's/^GRUB_CMDLINE_LINUX=.*$/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/' /etc/default/grub
update-grub

