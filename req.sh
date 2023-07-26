#!/bin/bash

# Function to check if a program is installed
is_installed() {
    command -v "$1" >/dev/null 2>&1
}

# Programs to install
programs=("exa" "lsd" "i3" "bat" "flameshot" "viewnior" "xdg-user-dirs" "imagemagick" "fzf" "tldr" "git" "zsh" "neovim" "ntfs-3g" "picom-jonaburg-git" "kitty" "alacritty" "acpi" "neofetch" "maim" "dunst" "samba" "lxappearance" "xarchiver" "brightnessctl" "light" "tree" "exa" "vlc" "polybar" "awesome" "bspwm" "android-tools" "polkit-gnome" "ranger" "gcc" "dosfstools" "f2fs-tools" "exfat-utils" "fuse3" "btrfs-progs" "pcmanfm" "unzip" "zip" "meson" "make" "sddm" "sddm-sugar-dark" "network-manager-applet" "xclip" "dmenu" "rofi" "gnome-disk-utility" "cryptsetup" "firefox" "nitrogen" )

# Check and install each program
for program in "${programs[@]}"; do
    if is_installed "$program"; then
        echo "$program is already installed."
    else
        sudo pacman -Syu  # Update package databases and system before installation
        if sudo pacman -S "$program" --noconfirm; then
            echo "$program has been installed."
        else
            echo "Pacman failed to install $program. Trying with yay..."
            if yay -S "$program" --noconfirm; then
                echo "$program has been installed using yay."
            else
                echo "Failed to install $program using both pacman and yay. Please install it manually."
            fi
        fi
    fi
done

