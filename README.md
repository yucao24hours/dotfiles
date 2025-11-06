# dotfiles

## Usage

1. リポジトリを clone

2. Homebrew をインストール

3. zprezto をインストール

4. 必要なファイル／ディレクトリをシンボリックリンク

   * Vim
   ```
   ln -s path/to/dotfiles/vim/.vimrc ~/.vimrc
   mkdir -p ~/.vim/tmp # シンボリックリンクに必要なのは .vim だけど、tmp ディレクトリに swap ファイルを置く設定にしてあるのでこのタイミングで作る 
   ln -s path/to/dotfiles/vim/ftdetect ~/.vim/ftdetect
   ```

   * Zsh
   ```
   ln -s path/to/dotfiles/zsh/.zshrc ~/.zshrc
   ```

   * Git
   ```
   ln -s path/to/dotfiles/git/.gitconfig ~/.gitconfig
   ```

5. vim-plug をインストール

6. Vim を起動してプラグインをインストール

7. その他ツールをインストール

### Windows Terminal

Windows Terminal's `settings.json` should be placed in `AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/` directory (under Windows User directory).
