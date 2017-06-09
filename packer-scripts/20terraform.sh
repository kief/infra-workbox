set -x

TERRAFORM_VERSION=0.9.8

fail()
{
  echo "FAIL: $*"
  exit 1
}

if [ ! -d /usr/local/terraform ] ; then
  apt-get install -y unzip || fail "Can't install unzip"

  [ -d /tmp/terraform ] || mkdir /tmp/terraform
  cd /tmp/terraform

  curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip || fail "Can't download terraform"
  unzip -q terraform_${TERRAFORM_VERSION}_linux_amd64.zip || fail "Can't unzip terraform"
  rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
  cd /tmp
  mv terraform /usr/local/ || fail "Can't move terraform into place"

  if [ ! -f /etc/profile.d/terraform.sh ] ; then
    echo "export PATH=\"\${PATH}:/usr/local/terraform\"" > /etc/profile.d/terraform.sh
  fi
else
  echo "terraform directory already exists in /usr/local/terraform"
fi
