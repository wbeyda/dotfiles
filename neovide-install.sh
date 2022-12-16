#!/bin/bash
# first of all make sure you have rust, cargo and rustup installed. 
# Pick only one. script, apt or snap. Not a mix. This will fuck you later because rustup will just update it's self and never update rustc
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

wget https://github.com/neovim/neovim/releases/download/v0.8.1/nvim-linux64.deb ~/Downloads
sudo apt install ./nvim-linux64.deb
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
sudo apt install -y curl \
    gnupg ca-certificates git \
    gcc-multilib g++-multilib cmake libssl-dev pkg-config \
    libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
    libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev \
    libxcursor-dev xclip
# if this doesn't install ¯\_(ツ)_/¯
cargo install --git https://github.com/neovide/neovide
rustup +nightly component add rust-analyzer-preview
echo "Grabbing a REPL\n"
cargo install evcxr_repl
echo "GRABBING a test runner\n"
cargo install bacon
echo "pretty sick git tool\n"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
rm lazygit.tar.gz
lazygit --version
# enable clipboard support
mkdir ~/.config/nvim/plugin
touch ~/.config/nvim/plugin/init.vim
echo "set clipboard+='unnamedplus'" >> init.vim
echo "All done! now open neovim"
