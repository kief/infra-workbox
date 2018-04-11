
set -ex

RUBYVER=2.5

apt-get install -y ruby${RUBYVER} ruby${RUBYVER}-dev liblzma-dev zlib1g-dev
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby${RUBYVER} 10
update-alternatives --install /usr/bin/gem gem /usr/bin/gem${RUBYVER} 10
echo "gem: --no-document" > /etc/gemrc
gem install bundler

exit 0
