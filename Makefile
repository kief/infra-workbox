.PHONY: build add clean distclean help
.DEFAULT_GOAL := help

all: build

SECRETS_FILE=../.secrets/packer-secrets.json
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')

ifeq ("$(wildcard $(SECRETS_FILE))","")
  $(error $(SECRETS_FILE) is missing)
endif

infra-workbox.box: ubuntu-17.10.json packer-scripts/* vagrant-scripts/* ../.secrets/packer-secrets.json
	packer build \
		-color=true \
		-var-file=$(SECRETS_FILE) \
		-var MINOR_VERSION=80 \
		ubuntu-17.10.json

build: infra-workbox.box ## Build and upload the .box file

add: infra-workbox.box ## Add the box to local cache
	vagrant box add -f --name infra-workbox infra-workbox.box

clean:  ## Delete output from the local directory
	rm -f infra-workbox.box

distclean: ## Clean up all interim files and things
	vagrant halt
	rm -rf ./*.box ./output-*-iso ./packer_cache ./.vagrant/machines

help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
