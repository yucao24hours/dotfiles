export PATH="/usr/local/bin:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Alias
alias g=git
alias be='bundle exec'

# Execute SublimeText3 with s command
export PATH=~/bin:$PATH
export EDITOR='s -w'

# rbenv
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# Configuration for Pretty Zsh
## 色設定
autoload -U colors; colors

## もしかして機能
setopt correct

## PCRE 互換の正規表現を使う
setopt re_match_pcre

## プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

## プロンプト指定
PROMPT="
[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!%B(>ᴗ･) <%b!(;x;%) <)%{${reset_color}%} "

## プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '

## もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}%B(?_?%) <%b もしかして %B%r%b %{$fg[red]%} ? [そう!(y), 違う!(n),a,e]:${reset_color} "


# 2013/11/18 Configuration for displaying Github branch name
## for vcs_info
function _precmd_vcs_info() {
  LANG=en_US.UTF-8 vcs_info
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _precmd_vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats "%b" "%s"
zstyle ':vcs_info:*' actionformats "%b|%a" "%s"

function vcs_info_for_git() {
  VCS_GIT_PROMPT="${vcs_info_msg_0_}"
  VCS_GIT_PROMPT_CLEAN="%{${fg[green]}%}"
  VCS_GIT_PROMPT_DIRTY="%{${fg[yellow]}%}"

  VCS_GIT_PROMPT_ADDED="%{${fg[cyan]}%}A%{${reset_color}%}"
  VCS_GIT_PROMPT_MODIFIED="%{${fg[yellow]}%}M%{${reset_color}%}"
  VCS_GIT_PROMPT_DELETED="%{${fg[red]}%}D%{${reset_color}%}"
  VCS_GIT_PROMPT_RENAMED="%{${fg[blue]}%}R%{${reset_color}%}"
  VCS_GIT_PROMPT_UNMERGED="%{${fg[magenta]}%}U%{${reset_color}%}"
  VCS_GIT_PROMPT_UNTRACKED="%{${fg[red]}%}?%{${reset_color}%}"

  INDEX=$(git status --porcelain 2> /dev/null)
  if [[ -z "$INDEX" ]];then
    STATUS="${VCS_GIT_PROMPT_CLEAN}${VCS_GIT_PROMPT}%{${reset_color}%}"
  else
    STATUS=" ${VCS_GIT_PROMPT_DIRTY}${VCS_GIT_PROMPT}%{${reset_color}%}"
    if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_UNMERGED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^R ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_RENAMED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_DELETED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_UNTRACKED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_MODIFIED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^A ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_ADDED$STATUS"
    elif $(echo "$INDEX" | grep '^M ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_ADDED$STATUS"
    fi
  fi
  echo "${STATUS}"
}

function vcs_info_with_color() {
  VCS_PROMPT_PREFIX="%{${fg[green]}%}[%{${reset_color}%}"
  VCS_PROMPT_SUFFIX="%{${fg[green]}%}]%{${reset_color}%}"

  VCS_NOT_GIT_PROMPT="%{${fg[green]}%}${vcs_info_msg_0_}%{${reset_color}%}"

  if [[ -n "${vcs_info_msg_0_}" ]]; then
    if [[ "${vcs_info_msg_1_}" = "git" ]]; then
      STATUS=$(vcs_info_for_git)
    else
      STATUS=${VCS_NOT_GIT_PROMPT}
    fi
    echo " ${VCS_PROMPT_PREFIX}${STATUS}${VCS_PROMPT_SUFFIX}"
  fi
}

