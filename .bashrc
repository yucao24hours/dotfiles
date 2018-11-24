source ~/.bash-powerline.sh

# Paths
export PATH="$PATH:${HOME}/.local/bin"
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin

## for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Alias
alias g=git
alias bi='bundle install'

# Setting for Golang
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
