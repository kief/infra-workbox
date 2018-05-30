set -ex

PACKER_VERSION=1.2.4

if [ ! -e /usr/local/bin/packer ] ; then
  apt-get install -y unzip

  mkdir -p /tmp/packer-download
  cd /tmp/packer-download

  curl -Os https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
  unzip -q packer_${PACKER_VERSION}_linux_amd64.zip
  rm ./packer_${PACKER_VERSION}_linux_amd64.zip
  mv ./packer /usr/local/bin/
else
  echo "packer binary is already installed"
fi
