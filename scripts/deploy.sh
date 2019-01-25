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

  # Removing the old debian packages from the deb branch
  rm ./deb/*.deb

  cp -Rf $TRAVIS_BUILD_DIR/plymouth-theme-meilix-logo_*_all.deb deb/
  cp -Rf $TRAVIS_BUILD_DIR/plymouth-theme-meilix-text_*_all.deb deb/
  cp -Rf $TRAVIS_BUILD_DIR/sddm-theme-meilix_*_all.deb deb/
  cp -Rf $TRAVIS_BUILD_DIR/meilix-default-theme_*_all.deb/ deb/
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
