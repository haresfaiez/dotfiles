set nocompatible
filetype plugin indent on

" view style
"let g:hybrid_use_Xresources = 1
" colorscheme hybrid
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" git
autocmd Filetype gitcommit setlocal spell textwidth=72

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Turn on line numbers
set number

" move backup files from working directory
set backupdir=./.backup,.,/tmp

" enable syntax highlighting
syntax enable

" golang
let g:go_disable_autoinstall = 0

" Set indenting to hard tabs (nospaces and use 4 chars)
set shiftwidth=4
set shiftround
set tabstop=4
set autoindent " always set autoindenting on
set smartindent
set expandtab " replace tab with characters

if has("vms")
  set nobackup " do not keep a backup file, use versions instead
else
  set backup " keep a backup file
endif
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" set up runtime path
set rtp+=~/.gvim/bundle/Vundle.vim
" Initialize vundle

call vundle#begin()

" This should always be the first
Plugin 'gmarik/Vundle.vim'

" vim-go
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'

" tagbar
Plugin 'majutsushi/tagbar'

" Gradle
Plugin 'tfnico/vim-gradle'

" YCM
" Plugin 'Valloric/YouCompleteMe'
" neo complete
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" ultisnips
Plugin 'SirVer/ultisnips'

" javascript syntax
Plugin 'jelera/vim-javascript-syntax'

" git gutter
Plugin 'airblade/vim-gitgutter'

" emmet
Plugin 'mattn/emmet-vim'

" highlight xml and html tags
Plugin 'Valloric/MatchTagAlways'

" Indent code levels
Plugin 'Yggdroot/indentLine'

" TODO list
Plugin 'vitalk/vim-simple-todo'

" Clojure highlight
Plugin 'guns/vim-clojure-highlight'

" Elixir
Plugin 'elixir-lang/vim-elixir'

" others
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'

" gotham colorscheme
Plugin 'whatyouhide/vim-gotham'

" Rust lang
Plugin 'rust-lang/rust.vim'

call vundle#end()

highlight clear SignColumn
highlight VertSplit    ctermbg=236
" highlight ColorColumn  ctermbg=237
" highlight LineNr       ctermbg=236 ctermfg=240
" highlight CursorLineNr ctermbg=236 ctermfg=240
" highlight CursorLine   ctermbg=236
" highlight StatusLineNC ctermbg=238 ctermfg=0
" highlight StatusLine   ctermbg=240 ctermfg=12
" highlight IncSearch    ctermbg=3   ctermfg=1
" highlight Search       ctermbg=1   ctermfg=3
" highlight Visual       ctermbg=3   ctermfg=0
" highlight Pmenu        ctermbg=240 ctermfg=12
" highlight PmenuSel     ctermbg=3   ctermfg=1
" highlight SpellBad     ctermbg=0

" Key mapping
" Close buffer without closing window
command Bcl bp|bd #
" Quick ESC
imap jj <ESC>
" Tab navigation
nnoremap <tab>h <C-w>h
nnoremap <tab>j <C-w>j
nnoremap <tab>k <C-w>k
nnoremap <tab>l <C-w>l
noremap <tab> <c-w><c-w>
" Map leader
let mapleader = ","
" Save buffer
nnoremap <Leader>w :w<CR>
" Quit buffer
nnoremap <Leader>q :q<CR>
" paste
vmap <Leader>p "+p
vmap <Leader>P "+P
" tagbar toggle
nmap <Leader>t :TagbarToggle<CR>
"MiniBufExplorer
nmap <Leader>b :MBEToggle<CR>
" Visual mode
nmap <Leader><Leader> V
" Junm to enclosing tag
nnoremap <leader>% :MtaJumpToOtherTag<cr>

" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" Gradle syntax highlighting
au BufNewFile,BufRead *.gradle set filetype=groovy

" Vimenter
" nerd tree
autocmd vimenter * NERDTree
"auto pairs
let g:AutoPairsFlyMode = 1

" 80 character limit
highlight OverLength ctermbg=darkred ctermfg=white
match OverLength /\%81v.\+/

" Status bar setting
" first, enable status line always
set laststatus=2
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=1
  au InsertLeave * hi StatusLine term=reverse ctermbg=7
endif
" color
hi StatusLine ctermbg=7 ctermfg=0

" Indent line settings
let g:indentLine_char = '|'

" Folding xml
augroup XML
  autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
	hi Folded ctermbg=236 ctermfg=1
augroup END

" enable html and css
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" " Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" autocomplete settings
" set completeopt-=preview
