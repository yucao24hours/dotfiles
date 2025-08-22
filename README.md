# dotfiles

## Usage

1. リポジトリを clone

2. 必要なファイル／ディレクトリをシンボリックリンク

   * Vim
   ```
   ln -s ~/w/dotfiles/vim/.vimrc ~/.vimrc
   ln -s ~/w/dotfiles/vim/ftdetect ~/.vim/ftdetect
   ```

   * Zsh
   ```
   ln -s ~/w/dotfiles/zsh/.zshrc ~/.zshrc
   ```

   * Git
   ```
   ln -s ~/w/dotfiles/git/.gitconfig ~/.gitconfig
   ```

3. vim-plug をインストール

4. Vim を起動してプラグインをインストール

5. その他ツールをインストール
   * Homebrew
   * fzf
   * zsh
   * など、.vimrc や .zshrc に依存しているもの

### Windows Terminal

Windows Terminal's `settings.json` should be placed in `AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/` directory (under Windows User directory).
