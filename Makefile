
all: infra-workbox.box

infra-workbox.box: multi-workbox-template.json packer-scripts/* vagrant-scripts/* ../.secrets/packer-secrets.json
	packer build -only=infra-workbox -color=true -var-file=../.secrets/packer-secrets.json multi-workbox-template.json

clean:
	rm infra-workbox.box

distclean:
	vagrant halt
	rm -rf ./*.box ./output-*-iso ./packer_cache ./.vagrant/machines

