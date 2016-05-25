
if [ ! -f /home/vagrant/projects/.secrets/infraworkbox_key \
    -o ! /home/vagrant/projects/.secrets/infraworkbox_key.pub ] ; then
  echo "ERROR: Can't find ssh keys in ../.secrets. Check the README for instructions."
  exit 1
fi

cp /home/vagrant/projects/.secrets/infraworkbox_key* /home/vagrant/.ssh/
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/infraworkbox_key*
