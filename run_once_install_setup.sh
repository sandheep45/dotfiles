#!/bin/bash

install_on_fedora() {
    sudo dnf install -y stow
    sudo dnf install -y curl
    curl https://pyenv.run | bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" -y
    sudo yum install libxcb openssl-devel libX11-devel
    sudo brew install nushell
    sudo brew install chezmoi
    brew install act
}

install_on_ubuntu() {
    cd .dotfiles && stow . && cd ..
    exec "$SHELL"

    python_latest_version_tag=$(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)
    pyenv --version

    pyenv install ${python_latest_version_tag}

    nvm install --lts

    brew install act
    brew install thefuck
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
}

install_on_mac() {
    brew install stow
    brew install curl
    brew install openssl cmake
    brew install pyenv
    brew install chezmoi
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
