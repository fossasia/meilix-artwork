# meilix-artwork

[![Join the chat at https://gitter.im/fossasia/meilix](https://badges.gitter.im/fossasia/meilix.svg)](https://gitter.im/fossasia/meilix?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) [![Build Status](https://travis-ci.org/fossasia/meilix.svg?branch=master)](https://travis-ci.org/fossasia/meilix-artwork)

## Getting Started:
- If you're new to this and want more information, visit [this link](https://wireframesketcher.com/support/install/installing-deb-package-on-ubuntu-debian.html) to better understand debian package installing. 
- Understand the working of Travis [here](https://docs.travis-ci.com/)

meilix-artwork comprises the sources for the two plymouth bootscreen theme packages for Meilix, one for logo, one for text based startup screen. These two packages should be installable/testable on any Debian or Ubuntu derivate system and could be configured as the default boot screen.
- plymouth-theme-meilix-logo_1.0-1_all.deb 
- plymouth-theme-meilix-text_1.0-1_all.deb

The naming meilix-artwork follows the convention on Debian family distributions, see xubuntu-artwork etc.

Previously Plymouth theme package debuilding used to be done within the meilix build process (https://github.com/fossasia/meilix) but now we moved it to this independent repository to simplify testing. We use Travis CI (https://travis-ci.org/fossasia/meilix-artwork) for debuilding the two debian packages. At present these files are found in the deb branch (https://github.com/fossasia/meilix-artwork/tree/deb) of this repository

# Local Installation

* **Step 1:** Fork the meilix-artwork repository and clone it to you machine
* **Step 2:** Cd into the cloned folder
* **Step 3:**  Run ```$ ./debuild.sh ``` (You will need executing permissions execute ```$ chmod +x ./debuild.sh``` for the permissions)
* **Step 4:** Two deb packages will be built in the cloned folder namely:
    - plymouth-theme-meilix-logo_1.0-1_all.deb 
    - plymouth-theme-meilix-text_1.0-1_all.deb


# Testing the deb 

### For the logo package
* **Step 1:** Install the plymouth-theme-meilix-logo_1.0-1_all.deb by running ```$ sudo dpkg -i ./plymouth-meilix-logo_1.0-1_all.deb```
* **Step 2:** Execute ```$ sudo apt-get install -f```
* **Step 3:** Install Plymouth with this theme: ```$ sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/meilix-logo/meilix-logo.plymouth 100```
* **Step 4:** Update Plymouth with this theme: ```$ sudo update-alternatives --config default.plymouth``` 
    - Select the meilix logo theme
* **Step 5:** Execute the command: ```$ sudo update-initramfs -u -k all```
* **Step 6:** Finally reboot

![Logo](/docs/screenshots/logo.png)

### For the text package
* **Step 1:** Install the plymouth-theme-meilix-text_1.0-1_all.deb by running ```$ sudo dpkg -i ./plymouth-meilix-text_1.0-1_all.deb```
* **Step 2:** Execute ```$ sdo apt-get install -f```
* **Step 3:** Install Plymouth with this theme: ```$ sudo update-alternatives --install /usr/share/plymouth/themes/text.plymouth text.plymouth /usr/share/plymouth/themes/meilix-text/meilix-text.plymouth 150```
* **Step 4:** Update Plymouth with this theme: ```$ sudo update-alternatives --config text.plymouth``` 
    - Select the meilix text theme
* **Step 5:** Execute the command: ```$ sudo update-initramfs -u -k all```

![Text](/docs/screenshots/text.png)

See https://wiki.ubuntu.com/Plymouth for details. Or  https://wiki.ubuntuusers.de/Plymouth/ for the instructions in Dutch.
