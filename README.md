# dotfiles

My dear dotfiles and configurations.

## Usage (macOS)

新しい Mac のセットアップ手順。上から順に実行する。

### 1. リポジトリを clone

```bash
git clone https://github.com/yucao24hours/dotfiles.git ~/ghq/github.com/yucao24hours/dotfiles
export DOTFILES=~/ghq/github.com/yucao24hours/dotfiles   # 以降のコマンドで使う（clone 先に合わせて変更）
```

ghq の管理下（`ghq root` のデフォルト `~/ghq`）に置いておくと、後で `ghq list` や Ctrl-G（`fzf-ghq`）から辿れる。ghq はまだ入っていないので、ここでは `git clone` で同じパスに置く。

### 2. Homebrew をインストール

公式サイトのインストールコマンドを実行する。インストール後、Apple Silicon の場合は `brew shellenv` の PATH 設定も行う。

### 3. ツールをインストール

`.zshrc` が `nodenv` / `rbenv` / `direnv` / `starship` を前提にしているため、シンボリックリンクを張る前に入れておく。入っていないと新しいシェルを開くたびに `command not found` が出る。

```bash
brew install --cask alacritty
brew install --cask font-hack-nerd-font   # Alacritty/tmux の矢羽表示に必須
brew install tmux starship direnv rbenv nodenv gh ghq fzf
brew install --cask claude-code            # Claude Code（下記注意を参照）
```

### 4. prezto をインストール

```bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

prezto 公式の「rc ファイルをシンボリックリンクする」手順は**実行しない**。次の手順で dotfiles 側の `.zshrc` / `.zpreztorc` を使うため、衝突する。

### 5. シンボリックリンクを張る

既存のファイルがあると `ln -s` が失敗するので、先に退避する。

```bash
mv ~/.zshrc ~/.zshrc.bak 2>/dev/null
mv ~/.gitconfig ~/.gitconfig.bak 2>/dev/null
```

- Vim

```bash
ln -s $DOTFILES/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/tmp # swap ファイルを置く設定にしてあるのでこのタイミングで作る
ln -s $DOTFILES/vim/ftdetect ~/.vim/ftdetect
```

- Zsh

```bash
ln -s $DOTFILES/zsh/.zshrc ~/.zshrc
ln -s $DOTFILES/zsh/.zpreztorc ~/.zpreztorc
```

- Starship (Nord テーマのプロンプト)

```bash
mkdir -p ~/.config
ln -s $DOTFILES/starship/starship.toml ~/.config/starship.toml
```

- Alacritty 0.13 以降 (Nord テーマ)

```bash
mkdir -p ~/.config/alacritty/colors
ln -s $DOTFILES/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s $DOTFILES/alacritty/colors/nord.toml ~/.config/alacritty/colors/nord.toml
```

- Tmux

```bash
ln -s $DOTFILES/.tmux.conf ~/.tmux.conf
mkdir -p ~/.tmux/themes
git clone https://github.com/nordtheme/tmux.git ~/.tmux/themes/nord-tmux
```

- Git

```bash
ln -s $DOTFILES/git/.gitconfig ~/.gitconfig
```

- RubyGems

```bash
ln -s $DOTFILES/.gemrc ~/.gemrc
```

### 6. Node.js と Ruby をインストール

新しいシェルを開いてから実行する（`nodenv` / `rbenv` が `.zshrc` 経由で初期化される）。バージョンは `install --list` に出るものから選ぶ。

```bash
# Node.js（coc.nvim が必要とするので Vim を開く前に入れる）
nodenv install --list | grep -E "^2[0-9]\." | tail -5
nodenv install <バージョン>
nodenv global <バージョン>
node -v

# Ruby
rbenv install --list | grep -E "^3\." | tail -5
rbenv install <バージョン>
rbenv global <バージョン>
ruby -v
```

プロジェクトごとの Ruby は、各リポジトリの `.ruby-version` に従って `rbenv install` する。

### 7. ghq と fzf でリポジトリ管理

[ghq](https://github.com/x-motemen/ghq) でリポジトリを一箇所に集約し、[fzf](https://github.com/junegunn/fzf) で絞り込んで移動する。インストールは手順 3 で済んでいる。

`zsh/.zshrc` に次を追記する（`~/.zshrc` は dotfiles へのシンボリックリンクなので、どちらを編集しても同じ）。

```zsh
# ghq 管理下のリポジトリへ移動 (Ctrl-G)
function fzf-ghq() {
  local dir=$(ghq list -p | fzf --reverse)
  if [ -n "$dir" ]; then
    BUFFER="cd ${dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-ghq
bindkey '^g' fzf-ghq
```

既存のリポジトリを移す必要はない。新しく clone するものから `ghq get` を使えばよい。

### 8. vim-plug をインストールして、プラグインを入れる

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
```

初回は `.vimrc` の `colorscheme nord` で `E185: Cannot find color scheme 'nord'` が出るが、nord 自体がプラグインなので想定内。ENTER で進めて `PlugInstall` を完了させれば、次回の起動から出なくなる。

### 9. GitHub に認証する

```bash
gh auth login   # GitHub.com / HTTPS / Login with a web browser
gh auth status
```

### 11. 動作確認

- Alacritty を再起動し、Starship のプロンプトと矢羽（Nerd Font）が崩れず表示される
- tmux を起動して Nord テーマが当たっている
- `vim` を起動してもエラー・警告が出ない
- `git config user.name` / `git config user.email` が、その PC で使いたい値になっている
- `ghq list` が通り、Ctrl-G で fzf の一覧が開く（リポジトリを `ghq get` したあと）

## Windows Terminal

Windows Terminal's `settings.json` should be placed in `AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/` directory (under Windows User directory).
