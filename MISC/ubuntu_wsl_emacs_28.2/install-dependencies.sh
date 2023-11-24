#!/bin/bash

# STUFF NEEDED FOR EMACS PACKAGES, should be done AFTER
# compile-install-emacs.sh

# Here is a list of programs I have installed for Emacs. They are not
# all explicitly required, however.

# ispell (spellchecking)
# emacs-common-non-dfsg (for missing emacs docs when C+h r)
# python3 (for python development)
# python3.10-venv (for python development)
# libtool libtool-bin autoconf automake cmake g++ libncurses-dev libz-dev libglib2.0-dev (for vterm)
# ripgrep (rg)
# nodejs npm (lsp)

sudo apt update && sudo apt upgrade -y

sudo apt install ispell libtool libtool-bin autoconf automake cmake g++ libncurses-dev libz-dev libglib2.0-dev ripgrep nodejs npm emacs-common-non-dfsg python3 python3.10-venv nodejs npm -y

sudo npm install -g tern (tern)
sudo pip install elpy rope jedi (elpy)

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

(for lsp ts-ls language server). Visit the instructions -
  https://github.com/nvm-sh/nvm#installation-and-update. After running
  the script - source .bashrc
