" Set leader for other settings to use.
let mapleader = " "
set timeoutlen=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"dein Scripts-----------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/vim-dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/vim-dein/')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" General
call dein#add('Shougo/deoplete.nvim')
call dein#add('morhetz/gruvbox')
call dein#add('scrooloose/nerdcommenter')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('w0rp/ale')
" Navigation & git
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('airblade/vim-gitgutter')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('easymotion/vim-easymotion')
" Status bar
call dein#add('tpope/vim-fugitive')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" Javascript
call dein#add('carlitux/deoplete-ternjs', {'build': 'npm i -g tern'})
call dein#add('pangloss/vim-javascript', {'on_ft': 'javascript'})
call dein#add('mxw/vim-jsx', {'on_ft': 'javascript'})
call dein#add('heavenshell/vim-jsdoc', {'on_ft': 'javascript'})
call dein#add('wokalski/autocomplete-flow', {'on_ft': 'javascript'})
" Typescript
call dein#add('mhartington/nvim-typescript', {'on_ft': 'typescript'})
call dein#add('HerringtonDarkholme/yats', {'on_ft': 'typescript'})
" Elm
call dein#add('ElmCast/elm-vim', {'on_ft': 'elm'})
" Markdown
call dein#add('godlygeek/tabular', {'on_ft': 'markdown'})
call dein#add('plasticboy/vim-markdown', {'on_ft': 'markdown'})

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
let g:EasyMotion_keys = 'aoeusnthidlrcg12340987'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" elm-vim
let g:elm_setup_keybindings = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tern_for_vim
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
"let g:tern#filetypes = [
                "\ 'jsx',
                "\ 'javascript.jsx',
                "\ 'vue',
                "\ 'javascript',
                "\ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete-tern
let g:deoplete#sources#ternjs#guess = 1
let g:deoplete#sources#ternjs#include_keywords = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tern
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx',
  \ 'vue',
  \ 'javascript',
  \ ]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete
let g:deoplete#enable_at_startup = 1
set completeopt+=noselect
autocmd CompleteDone * pclose
function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete=2
endfunction
function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete=0
endfunction

call deoplete#custom#set('buffer', 'mark', '*')
call deoplete#custom#set('ternjs', 'mark', 'JS')
call deoplete#custom#set('typescript', 'mark', 'TS')
call deoplete#custom#set('omni', 'mark', 'O')
call deoplete#custom#set('file', 'mark', 'F')
call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])

function! Preview_func()
  if &pvw
    setlocal nonumber norelativenumber
  endif
endfunction

autocmd WinEnter * call Preview_func()
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['around']

" Navigate completion results.
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <silent><expr> <C-k>
      \ pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <silent><expr> <S-TAB>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#close_popup()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#close_popup()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multi-cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-u>'
let g:multi_cursor_skip_key='<C-s>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_exit_from_insert_mode=0

" enable syntax in jsdoc comments.
let g:javascript_plugin_jsdoc = 1
let g:jsdoc_enable_es6 = 1

" auto folds.
function! SwapFoldMethod()
  if &foldmethod == "syntax"
    set foldmethod=manual
  else
    set foldmethod=syntax
  endif
endfunction

command Fold call SwapFoldMethod()
set foldlevel=99 " Start with folds open.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']
let g:ale_fixers['yaml'] = ['prettier']
nmap <c-l> :ALEFix<CR>
nmap <silent> ]e <Plug>(ale_next_wrap)
nmap <silent> [e <Plug>(ale_previous_wrap)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd-commenter
nmap <leader>c <plug>NERDCommenterToggle
vmap <leader>c <plug>NERDCommenterToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd-tree
map <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gitgutter
set signcolumn=yes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrl-p
set wildignore+=*/node_modules/*
set wildignore+=*/dist/*
set wildignore+=*/plugins/*
" <c-b> to search buffers.
map <c-b> <c-p><c-f>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
map <leader> <Plug>(easymotion-prefix)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim terminal
autocmd TermOpen * setlocal bufhidden=hide
autocmd TermOpen * setlocal relativenumber&
autocmd TermOpen * setlocal number&
autocmd TermOpen * setlocal signcolumn=no

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline TODO:
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
set hidden
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ',
      \ '1': '1 ',
      \ '2': '2 ',
      \ '3': '3 ',
      \ '4': '4 ',
      \ '5': '5 ',
      \ '6': '6 ',
      \ '7': '7 ',
      \ '8': '8 ',
      \ '9': '9 ',
      \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=2000

" Enable filetype plugins
" filetype plugin on
" filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Fix weird behavior or Y.
nmap Y y$

" Allow change window from terminal.
tmap <c-w> <c-\><c-n><c-w>
tmap <leader><esc> <C-\><C-n>
nmap <leader>. :bnext<CR>
nmap <leader>, :bprevious<CR>

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

nnoremap <silent> <esc> :noh<cr>

nnoremap Q <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore+=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set relativenumber
set number

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
