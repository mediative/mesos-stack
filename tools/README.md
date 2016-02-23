# Tools

Building is configured in the top-level `Makefile`

## Ansible role documentation

The `make-doc.sh` and `make-toc.sh` scripts are used for generating role
documentation based on the `tasks/main.yml` and `defaults/main.yml` files and
are automatically run by `make site`. See existing files for examples on how to
format comments.

## Updating the project pages

Travis will automatically build the GitBook site and push it to `gh-pages` when
something is merged to `master`. This is all configured in `.travis.yml` using
the `before_deploy` and `deploy` build stages. The project pages can manually be
updated by running:

    $ make deploy-site
