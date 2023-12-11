#!/bin/bash

# [[denote:20231126T012052][make denote faster on wsl]]

rsync -ah --progress --delete --exclude='.git' GIT/notes/ /mnt/c/Users/arvydas/OneDrive/Documents/notes/ --stats
