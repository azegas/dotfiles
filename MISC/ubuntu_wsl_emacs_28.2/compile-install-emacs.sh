#!/bin/bash

# STUFF NEEDED FOR BUILDING EMACS
sudo apt install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev libgnutls28-dev -y

cd ~

wget http://ftp.gnu.org/gnu/emacs/emacs-28.2.tar.gz
tar xvzf emacs-28.2.tar.gz

cd emacs-28.2
./configure
make
sudo make install
