
# apt-get install -y awscli groff

[ -d /tmp/awscli ] || mkdir /tmp/awscli
cd /tmp/awscli

curl -Os "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip -q awscli-bundle.zip
./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

mkdir -p -m 0700 /home/vagrant/.aws

cat > /home/vagrant/.aws/config <<ENDAWSCONFIG

[default]
region = eu-west-1

ENDAWSCONFIG
chown -R vagrant:vagrant /home/vagrant/.aws
