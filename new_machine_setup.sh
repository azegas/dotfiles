#!/bin/bash

# creating these, then using them later to make text bold in places

# using these variables later to make text bold in places
bold=$(tput bold)
normal=$(tput sgr0)

01_hello() {
    echo "Hello and welcome to blax!"
}

02_are_you_ready() {
    read -p "Are you ready to configure your new machine? (y/n): " response
    if [[ "$response" == "y" ]]; then
	03_auto_fetch_pull
    else
	echo "Script cancelled."
	04_copy_to_onedrive
	exit 1  # Exit the script with a non-zero status code (indicating an error)
    fi
}

03_auto_fetch_pull() {
    name="${bold}03_auto_fetch_pull${normal}"
    read -p "Do you want to run the $name script? (y/n): " response
    if [[ "$response" == "y" ]]; then
	echo '~/.emacs.d/MISC/auto_fetch_pull.sh' >> ~/.bashrc
	echo -e "DONE: $name"
	4_copy_to_onedrive
    else
	echo "It was chosen not to add $name."
	exit 1
    fi
}

04_copy_to_onedrive() {
    name="${bold}04_copy_to_onedrive${normal}"
    read -p "Do you want to run the $name script? (y/n): " response
    if [[ "$response" == "y" ]]; then
	echo '~/.emacs.d/MISC/copy_to_onedrive.sh' >> ~/.bashrc
	echo -e "DONE: $name"
    else
	echo "It was chosen not to add $name."
	exit 1
    fi
}

05_symlink_to_dotfiles_for_emacs() {
    name="${bold}05_symlink_to_dotfiles_for_emacs${normal}"
    read -p "Do you want to run the $name script? (y/n): " response
    if [[ "$response" == "y" ]]; then
	cd && ln -s GIT/dotfiles/.emacs.d/ .emacs.d
	echo -e "DONE: $name"
    else
	echo "It was chosen not to add $name."
	exit 1
    fi
}

# sudo hwclock thing also

echo '---------------------------'
01_hello
echo '---------------------------'
02_are_you_ready
