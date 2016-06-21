

apt-add-repository -y ppa:brightbox/ruby-ng
apt-get update
apt-get install -y ruby2.3 ruby2.3-dev liblzma-dev zlib1g-dev
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby2.3 10
update-alternatives --install /usr/bin/gem gem /usr/bin/gem2.3 10
echo "gem: --no-document" > /etc/gemrc
gem install bundler
