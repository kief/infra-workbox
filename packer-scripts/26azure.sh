
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" \
  > /etc/apt/sources.list.d/azure-cli.list

apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
apt-get install apt-transport-https
apt-get update && sudo apt-get install azure-cli
