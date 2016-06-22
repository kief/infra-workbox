

apt-add-repository -y ppa:brightbox/ruby-ng
apt-get update

RELEASE=$(lsb_release -cs)
case $RELEASE in
  xenial)
    RUBYVER=2.3
    ;;
  *)
    RUBYVER=2.2
    ;;
esac

apt-get install -y ruby${RUBYVER} ruby${RUBYVER}-dev liblzma-dev zlib1g-dev
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby${RUBYVER} 10
update-alternatives --install /usr/bin/gem gem /usr/bin/gem${RUBYVER} 10
echo "gem: --no-document" > /etc/gemrc
gem install bundler
