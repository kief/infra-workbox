set -x

PACKER_VERSION=1.0

fail()
{
  echo "FAIL: $*"
  exit 1
}

if [ ! -d /usr/local/packer ] ; then
  apt-get install -y unzip || fail "Can't install unzip"

  [ -d /tmp/packer ] || mkdir /tmp/packer
  cd /tmp/packer

  curl -Os https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip || fail "Can't download packer"
  unzip -q packer_${PACKER_VERSION}_linux_amd64.zip || fail "Can't unzip packer"
  rm packer_${PACKER_VERSION}_linux_amd64.zip
  cd /tmp
  mv packer /usr/local/ || fail "Can't move packer into place"

  if [ ! -f /etc/profile.d/packer.sh ] ; then
    echo "export PATH=\"\${PATH}:/usr/local/packer\"" > /etc/profile.d/packer.sh
  fi
else
  echo "packer directory already exists in /usr/local/packer"
fi
