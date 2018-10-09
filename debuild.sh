#!/bin/bash
# debian build the two packages
set -e
sudo apt-get -qq install libfile-fcntllock-perl  #installing files required to build plymouth
cd meilix-artwork                                #cd into the metapackage directory
echo y | debuild -uc -us #debuild the plymouth
