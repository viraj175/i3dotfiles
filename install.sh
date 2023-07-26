#!/bin/bash

# ANSI color codes
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
BOLD="\033[1m"
RESET="\033[0m"

echo -e "${BLUE}${BOLD}Installing your i3 config files.${RESET}"
echo -e "This will not break your system, it will just replace .config Directory."

echo -e "Backing up your previous ${YELLOW}.local${RESET} and ${YELLOW}.config${RESET} directories at ${GREEN}~/Backup${RESET}!"

sudo mkdir -p ~/Backup

sudo cp -R ~/.config ~/Backup

echo -e "${GREEN}Backup completed!${RESET}"

# Removing old directories.
echo -e "Now removing old directories"
rm -rf ~/.config
rm ~/.zshrc

# Now Replacing old files with new files.
echo -e "${BLUE}${BOLD}Replacing old files with new ones${RESET}"

mkdir ~/.local/bin

echo "${BLUE}Replacing config files${RESET}"
sudo cp -R ./.config ~/
echo "Placing new ascci art"
sudo cp -R ./asciiart ~/.local/share/
echo "placing colorscript and sysfetch"
cp ./colorscript ~/.local/bin/
cp ./sysfetch ~/.local/bin/

echo "${RED}${BOLD}placing .zshrc file to home directory${RESET}"
cp ./.zshrc ~/

echo "Installing Fonts"
yay -S ttf-jetbrains-mono-nerd

echo -e "${YELLOW}${BOLD}Your setup installed successfuly! Enjoy!${RESET}"

