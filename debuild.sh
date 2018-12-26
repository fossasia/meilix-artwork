#!/bin/bash
# debian build the two packages
set -e
sudo apt-get -qq install libfile-fcntllock-perl  #installing files required to build plymouth
# Removing the previous text and logo packages
sudo rm plymouth-theme-meilix-logo_*_all.deb
sudo rm plymouth-theme-meilix-logo-2_*_all.deb
sudo rm plymouth-theme-meilix-text_*_all.deb
cd meilix-artwork                                #cd into the metapackage directory
echo y | debuild -uc -us #debuild the plymouth
