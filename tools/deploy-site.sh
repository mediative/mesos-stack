#!/bin/bash
#
# Deploy doc site manually or from Travis to gh-pages branch on GitHub.
#
# Travis requires a GitHub token in order to push changes to `gh-pages`.
# This token can be generated from https://github.com/settings/tokens by
# clicking [Generate new token](https://github.com/settings/tokens/new).
# Copy the token to the clipboard.
#
# Next, install the Travis CLI and encrypt the token:
#
#    $ gem install travis
#    $ travis encrypt GH_TOKEN=<paste-token>
#    Please add the following to your .travis.yml file:
#
#      secure: "..."
#
# Copy the line starting with `secure:` and add it to `.travis.yml`
# under `env` / `global`.
#
#    env:
#      global:
#        secure: "..."
#
# See `.travis.yml` for how to configure Travis to call this script as
# part of the `deploy` build stage.
set -eu -o pipefail

# The output directory for the generated docs.
DOC_DIR="_book"

COMMIT="${TRAVIS_COMMIT:-$(git rev-parse HEAD)}"
BUILD_ID="${TRAVIS_BUILD_NUMBER:-$(git symbolic-ref --short HEAD)}"
BUILD_INFO="${TRAVIS_REPO_SLUG:-local}@$COMMIT ($BUILD_ID)"

if [ -z "${GH_TOKEN:-}" ]; then
  REPO="$(git config remote.origin.url)"
else
  REPO="https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git"
fi

rm -rf "$DOC_DIR/.git"
cd "$DOC_DIR"
git init
git config user.name "${USER}"
git config user.email "${USER}@${COMMIT}"
git add .
git commit -m "Update GitHub Pages from $BUILD_INFO"
git push --force --quiet "$REPO" master:gh-pages > /dev/null 2>&1  
