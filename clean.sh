#!/bin/sh

vagrant halt
rm -rf ./infra-workbox.box ./output-virtualbox-iso ./packer_cache ./.vagrant/machines

