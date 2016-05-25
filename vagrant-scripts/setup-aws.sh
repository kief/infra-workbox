
if [ ! -f /home/vagrant/projects/.secrets/aws_credentials ] ; then
  echo "ERROR: Can't find ../.secrets/aws_credentials. Check the README for instructions."
  exit 1
fi

cp /home/vagrant/projects/.secrets/aws_credentials /home/vagrant/.aws/credentials
chown -R vagrant:vagrant /home/vagrant/.aws
chmod 0600 /home/vagrant/.aws/credentials
