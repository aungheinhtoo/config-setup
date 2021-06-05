#!/bin/bash

git config --global user.email "aungheinhtoo@outlook.com"
git config --global user.name "Aung Hein"

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update

# Install apt packages
sudo apt install gh -y
sudo apt upgrade -y
sudo apt install htop piper font-manager code gnome-tweaks -y 

# Flatpak
flatpak install flathub com.spotify.Client -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub us.zoom.Zoom -y

# Install required fonts for user only. /usr/share/fonts/truetype/ for all users.
# sudo cp ./fonts/* /usr/share/fonts/truetype/

# Install miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ./miniconda.sh
bash ./miniconda.sh -b -u -p "/home/aungheinhtoo/miniconda3"

# zsh 
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Change default shell to zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# GTK Theme
git clone https://github.com/dracula/gtk.git ~/.themes/Dracula
