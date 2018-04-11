set -ex

GIT_CRYPT_VERSION=0.6.0

apt-get install -y openssl libssl-dev

if [ ! -e /usr/local/bin/git-crypt ] ; then
  mkdir -p /tmp/git-crypt-download
  cd /tmp/git-crypt-download
  curl -LfOs https://www.agwa.name/projects/git-crypt/downloads/git-crypt-${GIT_CRYPT_VERSION}.tar.gz
  tar xzf git-crypt-${GIT_CRYPT_VERSION}.tar.gz
  cd git-crypt-${GIT_CRYPT_VERSION}
  make
  make install
fi
