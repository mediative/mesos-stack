# Tools

Building is configured in the top-level `Makefile`

## Updating the project pages

Travis will automatically build the GitBook site and push it to `gh-pages` when
something is merged to `master`. This is all configured in `.travis.yml` using
the `before_deploy` and `deploy` build stages. The project pages can manually be
updated by running:

    $ make deploy-site
