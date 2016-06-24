#!/bin/sh

fail()
{
  echo "FAIL: $*"
  exit 1
}

if [ -f ../.secrets/packer-secrets.sh ] ; then
  . ../.secrets/packer-secrets.sh
fi

case $1 in
  wiley|15*)
    NAME=infra-workbox-wiley
    ;;
  trusty|14*)
    NAME=infra-workbox
    ;;
  *)
    echo "Add the Ubuntu version on the command line: 14, 15, or 16"
    exit
    ;;
esac
shift

packer build -only=${NAME} -color=true $* multi-workbox-template.json || fail "Packer failed"
vagrant box add -f --name "${NAME}" "${NAME}".box || fail "Failed to add the new box"

