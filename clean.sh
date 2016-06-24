#!/bin/sh

vagrant halt
rm -rf ./*.box ./output-*-iso ./packer_cache ./.vagrant/machines

