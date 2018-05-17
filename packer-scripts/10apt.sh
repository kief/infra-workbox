set -ex

apt-get install -y python2.7 python-pip
update-alternatives --install /usr/bin/python python /usr/bin/python2.7 10

apt-get install -y software-properties-common
apt-get install -y apt-transport-https

add-apt-repository -y ppa:webupd8team/java
apt-add-repository -y ppa:brightbox/ruby-ng

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > \
  /etc/apt/sources.list.d/docker.list

cat /etc/apt/sources.list.d/*.list

apt-get update

