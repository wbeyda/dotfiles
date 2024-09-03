#!/bin/bash

set -e

cat PS1 >> ~/.bashrc
source ~/.bashrc
# Update package list
echo "Updating package list..."
sudo apt update

# Install required packages
echo "Installing required packages..."
sudo apt install -y curl git fuse ripgrep xclip g++ pkg-config libx11-dev libasound2-dev libudev-dev libxkbcommon-x11-0 python3.10-venv


# Install Kitty terminal
echo "Installing Kitty terminal..."
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Create symbolic links for Kitty
echo "Creating symbolic links for Kitty..."
sudo ln -sf ~/.local/kitty.app/bin/kitty /usr/bin/kitty
sudo ln -sf ~/.local/kitty.app/bin/kitten /usr/bin/kitten

# Set up Kitty desktop entry
echo "Setting up Kitty desktop entry..."
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=$(readlink -f ~/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png)|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~/.local/kitty.app/bin/kitty)|g" ~/.local/share/applications/kitty*.desktop
echo 'kitty.desktop' > ~/.config/xdg-terminals.list

# Install Neovim
echo "Installing Neovim..."
wget -O ~/Downloads/nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x ~/Downloads/nvim.appimage
./~/Downloads/nvim.appimage --appimage-extract

# Move the Neovim AppImage to /opt and create a symlink
echo "Setting up Neovim..."
sudo mkdir -p /opt/neovim
sudo mv ~/Downloads/nvim.appimage /opt/neovim/
sudo ln -sf /opt/neovim/nvim.appimage /usr/local/bin/nvim

# Clone AstroNvim configuration
echo "Cloning AstroNvim configuration..."
rm -rf ~/.config/nvim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim

# Cleanup
echo "Cleaning up..."
rm -rf ~/Downloads/nvim.appimage
rm -rf ~/Downloads/squashfs-root

echo "Installation complete."
# Install my plugins
echo "Installing theme and plugins"
cp nvim/init.lua ~/.config/nvim/
cp nvim/lua/community.lua ~/.config/nvim/lua/
cp nvim/lua/plugins/astrocommunity.lua ~/.config/nvim/lua/plugins/
cp nvim/lua/plugins/surround.lua ~/.config/nvim/lua/plugins/
cp nvim/lua/plugins/monokai-pro-nvim.lua ~/.config/nvim/lua/plugins/

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install nvm and node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 18
nvm use 18


