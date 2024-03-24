#!/bin/bash

install_on_fedora() {
  echo "Installing on Fedora"
}

install_on_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y stow zsh build-essential jq
  sudo apt install pkg-config libssl-dev -y

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" -y
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/ubuntu/.bashrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  nvm_latest_version_tag=$(curl "https://api.github.com/repos/nvm-sh/nvm/releases/latest" | jq -r '.tag_name')
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${nvm_latest_version_tag}/install.sh | bash

  source ~/.bashrc
  brew install nushell
  # brew install chezmoi
  brew install pyenv
  source ~/.bashrc
}

install_on_mac() {
    brew install stow
    brew install curl
    brew install openssl cmake
    brew install pyenv
    # brew install chezmoi
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

}

OS="$(uname -s)"
case "${OS}" in
    Linux*)
        if [ -f /etc/fedora-release ]; then
            install_on_fedora
        elif [ -f /etc/lsb-release ]; then
            install_on_ubuntu
        else
            echo "Unsupported Linux distribution"
            exit 1
        fi
        ;;
    Darwin*)
        install_on_mac
        ;;
    *)
        echo "Unsupported operating system: ${OS}"
        exit 1
        ;;
esac



