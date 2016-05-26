#!/bin/sh

fail()
{
  echo "FAIL: $*"
  exit 1
}

packer build -color=true $* infra-workbox-template.json || fail "Packer failed"
vagrant box add -f --name infra-workbox infra-workbox.box || fail "Failed to add the new box"

