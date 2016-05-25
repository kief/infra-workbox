
apt-get install -y awscli

mkdir -p -m 0700 /home/vagrant/.aws

cat > /home/vagrant/.aws <<ENDAWSCONFIG

[default]
region = eu-west-1

ENDAWSCONFIG
chown -R vagrant:vagrant /home/vagrant/.aws
