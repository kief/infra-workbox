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
  xenial|16*)
    RELEASE=16.0.4
    NAME=infra-workbox-xenial
    ;;
  wiley|15*)
    RELEASE=15.10
    NAME=infra-workbox-wiley
    ;;
  trusty|14*)
    RELEASE=14.04
    NAME=infra-workbox-trusty
    ;;
  *)
    RELEASE=14.04
    NAME=infra-workbox
    ;;
esac
shift

packer build -color=true $* multi-workbox-template.json || fail "Packer failed"
vagrant box add -f --name "${NAME}" "${NAME}".box || fail "Failed to add the new box"

