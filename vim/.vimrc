call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'

Plug 'arcticicestudio/nord-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'airblade/vim-gitgutter'

Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'

call plug#end()

set termguicolors
colorscheme nord

syntax on
filetype plugin indent on

"set clipboard=unnamedplus
set cursorline
set directory=~/.vim/tmp//
set expandtab
set hlsearch
set number
set shiftwidth=2
set tabstop=2
set title

" fzf の設定
let mapleader = ","

nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>g :GFiles<CR>

" NERDTree の設定
" Vim 起動時に自動で NERDTree を開く
augroup NERDTreeAutoOpen
  autocmd!
  " 標準入力でもファイル引数でもないときだけ起動時に開く
  autocmd StdinReadPre * let s:std_in = 1
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif
augroup END

augroup NERDTreeAutoQuit
  autocmd!
  " NERDTree だけが唯一のウィンドウなら Vim を終了
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
        \ | if tabpagenr('$') > 1 | tabclose | else | quit | endif
        \ | endif
augroup END

let NERDTreeShowHidden=1

" vim-gitgutter の設定
set signcolumn=yes
set updatetime=100
