export PATH := node_modules/bin:$(PATH)

test:
	cd vagrant && ansible-playbook -i ../test/hosts --syntax-check --list-hosts site.yml
	cd vagrant && ansible-playbook -i ../test/hosts --syntax-check --list-hosts agent-tools.yml

site:
	gitbook build

deploy-site: site
	tools/deploy-site.sh

setup:
	pip install ansible
	npm install -g --prefix node_modules/ gitbook-cli
	gitbook install

.PHONY: test site setup
