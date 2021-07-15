#!/bin/bash

git config --global user.email "aungheinhtoo@outlook.com"
git config --global user.name "Aung Hein"

# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Github Desktop
# wget -qO - https://packagecloud.io/shiftkey/desktop/gpgkey | sudo tee /etc/apt/trusted.gpg.d/shiftkey-desktop.asc > /dev/null
# sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main" > /etc/apt/sources.list.d/packagecloud-shiftky-desktop.list'

sudo apt update

# Install apt packages
sudo apt install gh -y
sudo apt upgrade -y
sudo apt install htop piper neovim font-manager code gnome-tweaks ubuntu-restricted-extras -y 
sudo apt install github-desktop -y
curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y


# Flatpak
flatpak install flathub com.spotify.Client -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub us.zoom.Zoom -y

# Install required fonts for user only. /usr/share/fonts/truetype/ for all users.
# sudo cp ./fonts/* /usr/share/fonts/truetype/


# zsh 
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Change default shell to zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"

# Install miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ./miniconda.sh
zsh ./miniconda.sh -b -u -p "/home/aungheinhtoo/miniconda3"
/home/aungheinhtoo/miniconda3/bin/conda init zsh

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh

# GTK Theme
git clone https://github.com/dracula/gtk.git ~/.themes/Dracula
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh

timedatectl set-local-rtc 1 --adjust-system-clock
