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
call dein#add('neoclide/coc.nvim', {'merged': 0, 'rev': 'release'})
call dein#add('scrooloose/nerdcommenter')
call dein#add('w0rp/ale')
call dein#add('sheerun/vim-polyglot')
" Themes
call dein#add('morhetz/gruvbox')
call dein#add('mhartington/oceanic-next')
call dein#add('nathanaelkane/vim-indent-guides')
" Navigation & git
call dein#add('junegunn/fzf', {'build': './install --all'})
call dein#add('junegunn/fzf.vim')
call dein#add('scrooloose/nerdtree', {'build': ':UpdateRemotePlugins'})
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('airblade/vim-gitgutter')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-surround')
call dein#add('pelodelfuego/vim-swoop')
" Status bar
call dein#add('tpope/vim-fugitive')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" Elm
call dein#add('ElmCast/elm-vim', {'on_ft': 'elm'})
" Markdown
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
" CoC

" if hidden not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Automatically close preview after completion.
autocmd CursorMoved * if &previewwindow != 1 | pclose | endif

call coc#add_extension('coc-tsserver')
call coc#add_extension('coc-emoji')
call coc#add_extension('coc-json')
call coc#add_extension('coc-emmet')
call coc#add_extension('coc-css')
call coc#add_extension('coc-reason')

nmap <C-f> <Plug>(coc-fix-current)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Lines
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale
let g:ale_sign_error = '🙈'
let g:ale_sign_warning = '🤷'
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['html'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']
let g:ale_fixers['yaml'] = ['prettier']
let g:ale_fixers['graphql'] = ['prettier']
let g:ale_fixers['reason'] = ['refmt']
let g:ale_fixers['haskell'] = ['brittany']
let g:ale_fixers['terraform'] = ['terraform']
let g:ale_linters = {}
let g:ale_linters['haskell'] = ['stack_build']
:autocmd BufWritePre * ALEFix
nmap <silent> ]e <Plug>(ale_next_wrap)
nmap <silent> [e <Plug>(ale_previous_wrap)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd-commenter
nmap <leader>c <plug>NERDCommenterToggle
vmap <leader>c <plug>NERDCommenterToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd-tree
map <leader>t :NERDTreeToggle<CR>
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
colorscheme OceanicNext
set background=dark
let g:airline_theme='oceanicnext'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
noremap <C-p> :FZF<CR>
noremap <C-b> :Buffers<CR>
noremap <C-g> :Ag<CR>
" magic to prevent Ag matching file names.
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

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
" airline:
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

" Prevent replace from overwriting paste buffer.
vnoremap p "_dP

" Copy to system clipboard.
set clipboard+=unnamedplus

" Easier scape from terminal.
tmap <leader><esc> <C-\><C-n>

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" Easier change window.
nnoremap <expr> <tab>
      \ (winnr('$') == 1) ? "\<C-w>v\<C-w>\<C-w>" : "\<C-w>\<C-w>"

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

" I don't use folds, so disable them
set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files
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

set title

set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multi-cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-u>'
let g:multi_cursor_skip_key='<C-s>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_exit_from_insert_mode=0

" prevent multi-cursors + coc to interfere.
func! Multiple_cursors_before()
  CocDisable
  ALEDisable
endfunc
func! Multiple_cursors_after()
  CocEnable
  ALEEnable
endfunc

highlight multiple_cursors_cursor gui=inverse,bold
highlight multiple_cursors_visual gui=NONE guibg=LightYellow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" swoop
let g:swoopUseDefaultKeyMap = 0
nmap <leader>g :call Swoop()<CR>
vmap <leader>g :call SwoopSelection()<CR>
nmap <leader>m :call SwoopMulti()<CR>
vmap <leader>m :call SwoopMultiSelection()<CR>
