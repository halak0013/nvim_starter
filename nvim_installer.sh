#!/bin/bash

echo "Installing dependices"
sudo apt update
sudo apt install -y curl git npm fzf ripgrep fd-find tar wget luarocks libtree-sitter0 python3.*-venv

pip install ruff --break-system-packages.

echo "Installing neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

echo "Add neovim to PATH"
if [ -d ~/.zshrc ]; then
    echo "export PATH="\$PATH:/opt/nvim-linux64/bin"" >> ~/.zshrc
else
    echo "export PATH="\$PATH:/opt/nvim-linux64/bin"" >> ~/.bashrc
fi

echo "Nerd fonts configuration"
echo "Please select your font on terminal settings after installation"
echo "for gnome terminal, you can use 'IosevkaTermSlab Nerd Font' on profile font settings"
echo "for KDE konsole you can use 'IosevkaTermSlab Nerd Font' on profile font settings"
sleep 5
wget -c https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTermSlab.zip
unzip IosevkaTermSlab.zip -d ~/.fonts
rm IosevkaTermSlab.zip



echo "Lazy vim"
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim19
rm -rf ~/.config/nvim/.git

echo "Intalling LazyVim"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/