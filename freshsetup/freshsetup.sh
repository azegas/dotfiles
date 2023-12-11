#!/bin/bash

# ----------------------------------------------------------------------------

# [[denote:20231130T065309][fetch and pull automatically]]
if ! sudo grep -qxF '~/GIT/dotfiles/freshsetup/auto_fetch_pull.sh' ~/.bashrc; then
    # Command itself
    echo '~/GIT/dotfiles/freshsetup/auto_fetch_pull.sh' >> ~/.bashrc
    # Comments
    echo 'Line "~/GIT/dotfiles/freshsetup/auto_fetch_pull.sh" ADDED to .bashrc'
else
    echo 'Line "~/GIT/dotfiles/freshsetup/auto_fetch_pull.sh" EXISTS in .bashrc, SKIPPED'
fi

# ----------------------------------------------------------------------------

# [[denote:20231126T012052][make denote faster on wsl]]
if ! sudo grep -qxF '~/GIT/dotfiles/freshsetup/copy_to_onedrive.sh' ~/.bashrc; then
    # Command itself
    echo '~/GIT/dotfiles/freshsetup/copy_to_onedrive.sh' >> ~/.bashrc
    # Comments
    echo 'Line "~/GIT/dotfiles/freshsetup/copy_to_onedrive.sh" ADDED to .bashrc'
else
    echo 'Line "~/GIT/dotfiles/freshsetup/copy_to_onedrive.sh" EXISTS in .bashrc, SKIPPED'
fi

# [[denote:20231209T200922][wsl2 clock is out of sync with windows]]
/home/arvy/GIT/dotfiles/freshsetup/timesync.sh

# link dotfiles directory to .eamcs.d in user's home directory
rm -rf ~/.emacs.d
ln -s ~/GIT/dotfiles/.emacs.d/ ~/.emacs.d

# alias test
echo "alias em='emacs'" >> ~/.bashrc
