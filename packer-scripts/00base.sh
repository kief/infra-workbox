set -x

# remove x11
apt-get remove -y libx11.* libqt.*

apt-get update
apt-get -y upgrade
