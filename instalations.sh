
# essentials
sudo apt install curl
sudo apt install git
sudo apt install xsel
sudo apt install neovim
sudo apt install refind
sudo apt install lua5.3
sudo apt install htop
sudo apt install neofetch
sudo apt install screen

# utilities
sudo apt install ffmpeg
sudo apt install nmap
sudo apt install notion-desktop
sudo apt install flameshot
sudo apt install openjdk-8-jdk
sudo apt install espeak mbrola
sudo apt install translate-shell
sudo apt install openssh-server fail2ban
sudo apt install libdvdnav4 libdvd-pkg gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg
sudo apt install ubuntu-restricted-extras

# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install ripgrep
sudo apt install fd-find
  # ~ https://github.com/sharkdp/bat
wget https://github.com/sharkdp/bat/releases/download/v0.18.2/bat_0.18.2_amd64.deb
sudo dpkg -i bat_0.18.2_amd64.deb  # adapt version number and architecture
  # ~ git clone https://github.com/sebastiencs/icons-in-terminal.git
git clone https://github.com/sebastiencs/icons-in-terminal.git
cd icons-in-terminal
./icons-in-terminal/install.sh

# clang
sudo apt install clang-format clangd-9
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100

# nodejs
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash
sudo apt-get install nodejs

# python
sudo apt install python3 python3-pip

# npm
sudo npm i -g npm yarn
sudo npm i -g typescript ts-node nodemon neovim http-server notion-enhancer

# snap
sudo snap install whatsdesk
sudo snap install jupyter

# gnome-tweaks
sudo apt install gnome-tweak-tool gnome-shell-extensions
sudo apt install libproxy1-plugin-networkmanager gnome-shell-extension-system-monitor

# fancy things
sudo apt install cowsay
sudo apt install cmatrix
sudo apt install bsdgames
sudo apt install touchegg
sudo apt install gnome-sushi
