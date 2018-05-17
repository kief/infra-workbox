# Cargo culting to prevent error message
rm -rf /etc/udev/rules.d/70-persistent-net.rules
touch /etc/udev/rules.d/70-persistent-net.rules

apt-get upgrade -y linux-generic \
  linux-headers-generic \
  linux-image-generic
