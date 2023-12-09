#!/bin/bash

#[[denote:20231130T065309][fetch and pull automatically]]

REPO_DIR="$HOME/GIT/notes/"

function auto-fetch-pull() {
  if [ -d "$1" ]; then
    cd "$1" || exit
    echo "Fetching latest changes..."
    git fetch
    echo "Pulling changes into your branch..."
    git pull
  else
    echo "Directory '$1' not found."
  fi
}

auto-fetch-pull "$REPO_DIR"
