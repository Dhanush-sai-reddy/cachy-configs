#!/bin/bash
# 💫 https://github.com/JaKooLit 💫 #
# Hyprland-Dots to download from main #


## WARNING: DO NOT EDIT BEYOND THIS LINE IF YOU DON'T KNOW WHAT YOU ARE DOING! ##
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change the working directory to the parent directory of the script
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || { echo "${ERROR} Failed to change directory to $PARENT_DIR"; exit 1; }

# Source the global functions script
if ! source "$(dirname "$(readlink -f "$0")")/Global_functions.sh"; then
  echo "Failed to source Global_functions.sh"
  exit 1
fi

# Restore local hyprland configs
printf "${NOTE} Restoring ${SKY_BLUE}local Hyprland configs${RESET}....\n"

HYPR_DIR="$HOME/.config/hypr"

# Backup current config if it exists
if [ -d "$HYPR_DIR" ]; then
  BACKUP="$HYPR_DIR.bak.$(date +%Y%m%d-%H%M%S)"
  printf "${NOTE} Backing up current config to ${SKY_BLUE}${BACKUP}${RESET}\n"
  cp -r "$HYPR_DIR" "$BACKUP"
fi

# Copy local configs
mkdir -p "$HYPR_DIR"
if cp -rf local-hypr-configs/* "$HYPR_DIR/"; then
  printf "${OK} Local Hyprland configs restored successfully!\n"
else
  echo -e "$ERROR Failed to restore local-hypr-configs"
fi

printf "\n%.0s" {1..2}