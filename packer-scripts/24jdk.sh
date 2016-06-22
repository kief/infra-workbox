
RELEASE=$(lsb_release -cs)
if [ "${RELEASE}" = "xenial" ] ; then
  apt-get install -y openjdk-8-jdk
else
  apt-get install -y openjdk-7-jdk
fi
