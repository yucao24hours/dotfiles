# Alias
alias g=git
alias bi='bundle install'
alias ds='docker compose'

# Paths
export PATH="$PATH:${HOME}/.local/bin"

# Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# Setting for Golang
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Setting for Elixir
export PATH=$PATH:/usr/local/Cellar/elixir/1.3.4/bin

export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin

# User configuration

# コマンド履歴の保存先。
HISTFILE="${HOME}/.zsh_history"

# メモリに保存される履歴の件数。(保存数だけ履歴を検索できる)
HISTSIZE=1000000

# HISTFILE で指定したファイルに保存される履歴の件数。
SAVEHIST=1000000

# source "${HOME}/.dotfiles/super-itchy.zsh"

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

export EDITOR='vim'

export EMOJI_SPEC=3


# https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# そろそろツール/プログラムごとに file を分けたくなってきた

autoload -Uz select-word-style
select-word-style bash

bindkey -d
bindkey -e

# added by travis gem
[ -f /Users/yucao24hours/.travis/travis.sh ] && source /Users/yucao24hours/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yucao24hours/work/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/yucao24hours/work/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yucao24hours/work/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/yucao24hours/work/google-cloud-sdk/completion.zsh.inc'; fi
