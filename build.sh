#!/bin/sh

fail()
{
  echo "FAIL: $*"
  exit 1
}

packer build -color=true $* alpine-3.3.1-x86_64.json || fail "Packer failed"
vagrant box add -f --name infra-workbox infra-workbox.box || fail "Failed to add the new box"

