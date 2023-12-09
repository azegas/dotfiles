#!/bin/bash

# creating these, then using them later to make text bold in places
bold=$(tput bold)
normal=$(tput sgr0)

are_you_ready() {
    read -p "Are you ready to configure your new machine? (y/n): " response
    if [[ "$response" == "y" ]]; then
	auto_fetch_pull
    else
	echo "No action taken."
	exit 1  # Exit the script with a non-zero status code (indicating an error)
    fi
}

hello() {
    echo "Hello and welcome to blax!"
}

#[[denote:20231130T065309][fetch and pull automatically]]
auto_fetch_pull() {
    name="${bold}auto_fetch_pull${normal}"
    read -p "Do you want to run the $name script? (y/n): " response
    if [[ "$response" == "y" ]]; then
	echo '~/.emacs.d/MISC/auto_fetch_pull.sh' >> ~/.bashrc
	echo -e "DONE: $name"
	copy_to_onedrive
    else
	echo "It was chosen not to add."
	exit 1  # Exit the script with a non-zero status code (indicating an error)
    fi
}

# [[denote:20231126T012052][make denote faster on wsl]]
copy_to_onedrive() {
    name="${bold}copy_to_onedrive${normal}"
    read -p "Do you want to run the $name script? (y/n): " response
    if [[ "$response" == "y" ]]; then
	echo '~/.emacs.d/MISC/copy_to_onedrive.sh' >> ~/.bashrc
	echo -e "DONE: $name"
    else
	echo "It was chosen not to add."
	exit 1  # Exit the script with a non-zero status code (indicating an error)
    fi
}

ln -s GIT/dotfiles/.emacs.d/ .emacs.d

sudo hwclock thing also

echo '---------------------------'
hello
echo '---------------------------'
are_you_ready
