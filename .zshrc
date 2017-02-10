#$(boot2docker shellinit)

export PATH="/usr/local/bin:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Alias
alias g=git
alias br='bin/rails'
alias ll='ls -la'
alias bi='bundle install'
alias blog='cd ~/work/blog/jekyll-incorporated/'
alias kaja='cd ~/work/yochiyochi/kajaeru/'
alias cu='bin/cucumber'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export RBENV_ROOT=/usr/local/rbenv
eval "$(rbenv init -)"

# pyenv

if type pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$HOME/.cabal/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source "${HOME}/.zsh/themes/super-itchy.zsh"

function toggle-rprompt() {
  if [ -z "${HIDE_RPROMPT}" ]; then
    unset RPROMPT
    export HIDE_RPROMPT=true
    zle reset-prompt
  else
    source "${HOME}/.zsh/themes/super-itchy.zsh"
    unset HIDE_RPROMPT
    zle accept-line
  fi
}
autoload -U toggle-rprompt
zle -N toggle-rprompt
bindkey '^[r' toggle-rprompt

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

export EDITOR='vim'

export EMOJI_SPEC=3

# Setting for Golang
export GOPATH=$HOME/work

# https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Setting for RabbitMQ execution
export PATH=$PATH:/usr/local/sbin

# Setting for Elixir
export PATH=$PATH:/usr/local/Cellar/elixir/1.3.4/bin
# そろそろツール/プログラムごとに file を分けたくなってきた
