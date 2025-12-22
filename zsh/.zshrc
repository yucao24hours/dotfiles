# ============================================================================
# Basic Configuration
# ============================================================================

# Aliases
alias g=git
alias bi='bundle install'
alias ds='docker compose'

# Editor
export EDITOR='vim'

# Language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Command history
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

# ============================================================================
# PATH Configuration
# ============================================================================

export PATH="$PATH:${HOME}/.local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/bin"

# ============================================================================
# Zsh Configuration
# ============================================================================

# Completions (Homebrew)
if [[ -d /opt/homebrew/share/zsh-completions ]]; then
  fpath=(/opt/homebrew/share/zsh-completions $fpath)
elif [[ -d /usr/local/share/zsh-completions ]]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# Word style (bash-like)
autoload -Uz select-word-style
select-word-style bash

# Key bindings (Emacs mode)
bindkey -d
bindkey -e

# ============================================================================
# Prezto
# ============================================================================

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Disable command correction
unsetopt correct_all

# ============================================================================
# Development Tools & Languages
# ============================================================================

# Golang
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Volta (Node.js version manager)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# nodenv (Node.js version manager)
export PATH="$HOME/.nodenv/bin:$PATH"
if command -v nodenv > /dev/null; then
  eval "$(nodenv init -)"
fi

# ============================================================================
# Cloud & Other Tools
# ============================================================================

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# direnv
eval "$(direnv hook zsh)"

# Travis CI
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Android Studio
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PLATFORM_TOOLS_PATH="$ANDROID_HOME/platform-tools"
export PATH="$ANDROID_HOME/bin:$PLATFORM_TOOLS_PATH:$PATH"

# ============================================================================
# Prompt
# ============================================================================

# Starship (Nord theme) - must be initialized last
eval "$(starship init zsh)"
