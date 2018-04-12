snap install kubectl --classic
snap install minikube
snap install helm

if [ ! -e /usr/local/bin/kops ] ; then
  mkdir -p /tmp/kops-download
  cd /tmp/kops-download
  curl -LfOs https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
  chmod +x kops-linux-amd64
  mv kops-linux-amd64 /usr/local/bin/kops
fi
