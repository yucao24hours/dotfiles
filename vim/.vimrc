call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'

Plug 'arcticicestudio/nord-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'preservim/vim-markdown'

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
set shortmess-=S

" fzf の設定
let mapleader = " "

nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>g :GFiles<CR>

" 最近開いたファイルを開く
nnoremap <Leader>ur :call OpenRecentFile()<CR>

function! OpenRecentFile()
  " oldfiles から現在のディレクトリのファイルのみを抽出
  let recent_files = filter(copy(v:oldfiles), 'filereadable(expand(v:val))')
  if len(recent_files) == 0
    echo "最近開いたファイルがありません"
    return
  endif
  " 最初のファイル（最も最近開いたファイル）を開く
  execute 'edit ' . fnameescape(recent_files[0])
endfunction

" NERDTree の設定
let NERDTreeShowHidden=1

" vim-gitgutter の設定
set signcolumn=yes
set updatetime=100

" easy-align の設定
" ビジュアルモードで ga を押すと起動
xmap ga <Plug>(EasyAlign)
" ノーマルモードで ga を押すと起動
nmap ga <Plug>(EasyAlign)

" Coc
" 自動インストールする拡張機能
let g:coc_global_extensions = ['coc-solargraph', 'coc-prettier', 'coc-tsserver']

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" ホバーでドキュメントを表示
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" シンボルのリネーム
nmap <leader>rn <Plug>(coc-rename)

" オートコンプリートで Enter で確定
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Tab で次の候補、Shift-Tab で前の候補（Copilot は Ctrl+L で確定）
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-l> copilot#Accept("")
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<TAB>"
inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"

" TypeScript/JavaScript ファイルの設定
augroup TypeScriptSettings
  autocmd!
  autocmd FileType typescript,typescriptreact,javascript,javascriptreact setlocal shiftwidth=2 tabstop=2 expandtab
augroup END

" vim-markdown の設定
" YAML front matter をサポート
let g:vim_markdown_frontmatter = 1

" クイックフィックス（不足しているインポートを追加など）
nmap <leader>qf <Plug>(coc-fix-current)
