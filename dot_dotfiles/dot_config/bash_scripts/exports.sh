export PATH="$HOME/.local/nvim/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/android-studio/bin:$PATH"
export PATH="$HOME/bin/:$PATH"
export PATH="$PATH:/home/sandheep/.dotnet/tools"

# bun completions
[ -s "/home/sandheep/.bun/_bun" ] && source "/home/sandheep/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# export ANDROID_SDK_ROOT="$HOME/.android/avd"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools/:$PATH"
export PATH="$ANDROID_HOME/emulator/:$PATH"

# pnpm
export PNPM_HOME="/home/sandheepkumar/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

if command -v colorls &>/dev/null; then
	source $(dirname $(gem which colorls))/tab_complete.sh
fi

PATH=~/.console-ninja/.bin:$PATH

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

if [ -d /home/linuxbrew ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
