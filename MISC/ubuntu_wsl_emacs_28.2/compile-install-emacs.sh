#!/bin/bash

# Create a directory for Emacs compilation
mkdir -p ~/emacs_build
cd ~/emacs_build || exit

# STUFF NEEDED FOR BUILDING EMACS
sudo apt install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev libgnutls28-dev -y

# Download Emacs source code
wget http://ftp.gnu.org/gnu/emacs/emacs-28.2.tar.gz
tar xvzf emacs-28.2.tar.gz

cd emacs-28.2 || exit
./configure
make
sudo make install

# Remove installation files
# cd ~/emacs_build && rm -rf emacs-28.2 emacs-28.2.tar.gz