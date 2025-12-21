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
   ln -s path/to/dotfiles/zsh/.zpreztorc ~/.zpreztorc
   ```

   * Starship (Nord テーマのプロンプト)
   ```
   brew install starship
   mkdir -p ~/.config
   ln -s path/to/dotfiles/starship/starship.toml ~/.config/starship.toml
   ```

   * Alacritty (Nord テーマ)
   ```
   mkdir -p ~/.config/alacritty/colors
   ln -s path/to/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
   ln -s path/to/dotfiles/alacritty/colors/nord.toml ~/.config/alacritty/colors/nord.toml
   ```

   * Tmux
   ```
   ln -s path/to/dotfiles/.tmux.conf ~/.tmux.conf
   mkdir -p ~/.tmux/themes
   git clone https://github.com/nordtheme/tmux.git ~/.tmux/themes/nord-tmux
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
