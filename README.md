# dotfiles

## Usage
Create symlinks from `$HOME `:house: to them.

### Windows Terminal

Windows Terminal's `settings.json` should be placed in `AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/` directory (under Windows User directory).

To create a symlink for it, run the command below:

```sh
ln -s ${path/to/dotfiles}/windows_terminal/settings.json ${user_directory}/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
```
