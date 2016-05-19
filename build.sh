#!/bin/sh

packer build -color=true $* alpine-3.3.1-x86_64.json
