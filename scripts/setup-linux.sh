# install software
sudo apt-get update
sudo apt-get install silversearcher-ag
sudo apt-get zsh

# install neovim
sudo wget -O nvim https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -P /usr/local/bin
sudo chmod +x /usr/local/bin/nvim

# install docker
sudo sh -c "$(curl -fsSL https://get.docker.com)"
sudo usermod -aG docker $(whoami)

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
