" keep recommended defaults (vim >= 8)
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" allow jumping to matching element
runtime macros/matchit.vim

" remap the leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" set font for GVIM
set guifont=Iosevka\ Term\ 10

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" highlight current line
set cursorline

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" softwrap
set wrap linebreak

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" show line numbers
set number relativenumber

" Make wildmenu behave like similar to Bash completion.
" set wildmode=list:longest
"set confirm

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx  

" enable mouse (for tmux)
set mouse=a

" auto install plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" search
" note: we need both fzf commands
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" general
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-abolish'

" motion
Plug 'easymotion/vim-easymotion'

" add-ons
Plug 'tpope/vim-fugitive'
Plug 'junkblocker/git-time-lapse'
Plug 'idanarye/vim-merginal'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'
Plug 'aacunningham/vim-fuzzy-stash'
Plug 'junegunn/vim-peekaboo'
Plug 'sharat87/roast.vim' 
Plug 'rhysd/vim-clang-format'
Plug 'jpalardy/vim-slime'

" language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kergoth/vim-bitbake'
Plug 'tpope/vim-fireplace'

" snippets
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'

" color schemes
Plug 'YorickPeterse/vim-paper'
Plug 'axvr/photon.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'
Plug 'andreasvc/vim-256noir'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" set colorscheme
function! GruvboxTheme()
  let $BAT_THEME='zenburn'
  colorscheme gruvbox
endfunction

set t_Co=256
set background=dark
call GruvboxTheme()

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:50%', 'ctrl-/']

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" Override git log to show authors
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h %an: %s%d %C(black)%C(bold)%cr"'

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" only
nnoremap <silent> <Leader>i :only <CR>

" header/source switch using related filenames 
nnoremap <silent> <C-h> :CocCommand clangd.switchSourceHeader<CR>

" edit this file
nnoremap <silent> <Leader>ve :e ~/configuration/vimrc.vim<CR>
" reload this file
nnoremap <silent> <Leader>vr :source ~/configuration/vimrc.vim<CR>

" files
nnoremap <silent> <C-p> :Files<CR>

" History
nnoremap <silent> <Leader>b :History<CR>

" Marks
nnoremap <silent> <Leader>m :Marks<CR>

" buffers
nnoremap <silent> <Leader>l :Buffers<CR>

" commands
nnoremap <silent> <Leader><C-p> :Commands<CR>

" search current word in all files
nnoremap <silent> <Leader>F :Ag <C-R><C-W><CR>

" explore current wd
nnoremap <silent> <Leader>x :Explore <CR>

" Git
nnoremap <silent> <Leader>G :Git <CR>

" look here and up for local tags
set tag=./tags,tags;

" Customize fzf colors to match color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Normal'],
  \ 'border':  ['fg', 'Error'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" customize Ag to have better (the same as above) colors.
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path "1;36"', fzf#vim#with_preview(), <bang>0)

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

" show vertical line after end of textwidth
set colorcolumn=+1

" set textwidth
set textwidth=160

" nerdtree bindings
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nh :NERDTreeCWD<CR>
let g:NERDTreeWinSize=60

" unsearch
nnoremap <leader>u :nohl <CR>

" format current document using prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
command! -nargs=0 FormatDocument :CocCommand editor.action.formatDocument

" coc configuration
let g:coc_global_extensions = [
      \'coc-conjure', 
      \'coc-prettier', 
      \'coc-eslint', 
      \'coc-json', 
      \'coc-css', 
      \'coc-thrift-syntax-support',
      \'coc-snippets',
      \'coc-tsserver',
      \'coc-tslint-plugin',
      \'coc-python'
      \]

source ~/configuration/coc.vim

" clang-format
let g:clang_format#enable_fallback_style=0
let g:clang_format#detect_style_file=1

" always show signcolumn to prevent gitgutter from collapsing the line numbers
set signcolumn=yes

" set up vim slime
let g:slime_target = "tmux"
