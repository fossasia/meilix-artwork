#!/usr/bin/env bash

# Bash script to the generated deploy deb files to "deb" branch
# for commits (including merge commits)

set -e

if [ "$TRAVIS_PULL_REQUEST" = "false" ]; then
  # Setup git
  cd $HOME
  git config --global user.email "noreply@travis.com"
  git config --global user.name "Travis CI" 

  # Clone the repository in the buildApk folder
  git clone --quiet --branch=deb https://abishekvashok:$GITHUB_API_KEY@github.com/fossasia/meilix-artwork deb > /dev/null

  cp -Rf $TRAVIS_BUILD_DIR/plymouth-meilix-logo_1.0-1_all.deb deb/
  cp -Rf $TRAVIS_BUILD_DIR/plymouth-meilix-text_1.0-1_all.deb deb/
  cd deb

  git checkout --orphan workaround
  git add -A

  # Commit and skip the tests for that commit
  git commit -am "Travis build pushed [skip ci]"

  git branch -D deb
  git branch -m deb

  # Push to the deb branch
  git push origin deb --force --quiet> /dev/null
else
  echo "Skipping deployment on PR"
fi

exit 0
