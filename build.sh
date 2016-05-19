#!/bin/sh

fail()
{
  echo "FAIL: $*"
  exit 1
}

packer build -color=true $* ubuntu-14.04.3-x86_64.json || fail "Packer failed"
vagrant box add -f --name infra-workbox infra-workbox.box || fail "Failed to add the new box"

