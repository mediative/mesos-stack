export PATH := node_modules/bin:$(PATH)

test:
	cd vagrant && ansible-playbook -i ../test/hosts --syntax-check --list-hosts site.yml
	cd vagrant && ansible-playbook -i ../test/hosts --syntax-check --list-hosts agent-tools.yml

ROLES_TASKS = $(wildcard roles/*/tasks/main.yml)
ROLES = $(sort $(patsubst roles/%/tasks/main.yml,%,$(ROLES_TASKS)))

roles/%.md: roles/%/tasks/main.yml tools/make-doc.sh Makefile $(wildcard roles/%/defaults/main.yml)
	tools/make-doc.sh $* > $@
	@grep -q "$@" .git/info/exclude || echo "$@" >> .git/info/exclude

SUMMARY.gen.md: SUMMARY.md tools/make-toc.sh Makefile $(ROLES_TASKS)
	tools/make-toc.sh $< $(ROLES) > $@
	@grep -q "$@" .git/info/exclude || echo "$@" >> .git/info/exclude

site-clean:
	$(RM) SUMMARY.gen.md $(patsubst %,roles/%.md,$(ROLES))

site: SUMMARY.gen.md $(patsubst %,roles/%.md,$(ROLES))
	gitbook build

deploy-site: site
	tools/deploy-site.sh

setup:
	pip install ansible
	npm install -g --prefix node_modules/ gitbook-cli
	gitbook install

release: release-check test
	# Update version example in README.md
	sed -i "s/[0-9]\+\.[0-9]\+\.[0-9]\+/$(version)/" README.md
	# Update notes for unreleased version
	sed -i "s/^## master$$/## $(version)/" NEWS.md
	# Last review.
	$(EDITOR) NEWS.md
	# Create release commit and tag.
	git diff --exit-code --quiet || git commit -a -m "Version $(version)"
	git tag -a -m "Version $(version)" $(version)
	@echo "Publish release using: git push origin master $(version)"

release-check:
ifndef version
	$(error Please define a version: `make release version=x.y.z`)
endif

.PHONY: test site deploy-site setup release release-check
