set -ex

apt-get -y install dkms make

if [ ! -f /home/vagrant/VBoxGuestAdditions.iso ] ; then
  echo "/home/vagrant/VBoxGuestAdditions.iso has not been uploaded as expected"
  exit 1
fi

mount -o loop,ro /home/vagrant/VBoxGuestAdditions.iso /mnt/
/mnt/VBoxLinuxAdditions.run || :
umount /mnt/
rm -f /home/vagrant/VBoxGuestAdditions.iso

exit 0
