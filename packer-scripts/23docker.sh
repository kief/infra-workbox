set -x

apt-get install -y linux-image-extra-$(uname -r) apparmor apt-transport-https ca-certificates

apt-get purge lxc-docker
# apt-cache policy docker-engine
apt-get install -y docker.io
