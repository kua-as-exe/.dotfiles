# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

# neovim plugins dependencies

sudo apt-get install ripgrep
sudo apt install fd-find

# ~ https://github.com/sharkdp/bat
wget https://github.com/sharkdp/bat/releases/download/v0.18.2/bat_0.18.2_amd64.deb
sudo dpkg -i bat_0.18.2_amd64.deb  # adapt version number and architecture

# ~ git clone https://github.com/sebastiencs/icons-in-terminal.git
git clone https://github.com/sebastiencs/icons-in-terminal.git
cd icons-in-terminal
./icons-in-terminal/install.sh
cd ../


# neoclip - sqlite
# ~ https://github.com/AckslD/nvim-neoclip.lua

sudo apt-get install sqlite3 libsqlite3-dev
