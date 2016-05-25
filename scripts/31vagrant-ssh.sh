
mkdir -p -m 0700 /home/vagrant/.ssh

cat > /home/vagrant/.ssh/config <<ENDSSHCONFIG
Host *
    User ubuntu
    IdentityFile ~/.ssh/infraworkbox_key
ENDSSHCONFIG

chown -R vagrant:vagrant /home/vagrant/.ssh
