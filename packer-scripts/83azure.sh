
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" \
  > /etc/apt/sources.list.d/azure-cli.list

# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

apt-get install -y --force-yes apt-transport-https
apt-get update
apt-get install -y --force-yes azure-cli
