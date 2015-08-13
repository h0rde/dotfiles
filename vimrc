"don't use vi compatible mode
set nocompatible

"Bundle Config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
Bundle 'majutsushi/tagbar'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
"Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'ervandew/supertab'
Bundle 'myusuf3/numbers.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'https://github.com/jeetsukumaran/vim-buffergator'
"Bundle 'jiangmiao/auto-pairs'
Bundle 'haya14busa/incsearch.vim'

Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'jaromero/vim-monokai-refined'
Bundle 'vim-scripts/twilight'
Bundle 'romainl/Apprentice'
Bundle 'whatyouhide/vim-gotham'

"tabs and spaces
set tabstop=2 "tab column width
set softtabstop=2 "tab column width
set shiftwidth=2 "reindent column width
set expandtab "convert tab to space
set smarttab "tab smartly
set autoindent
set shiftround
set nojoinspaces "remove spaces when joining

"viewing
set ruler "show cursor position
set number "show line numbers
set relativenumber "show relative line numbers
set showcmd "display cmd info
set showmatch "show matching bracket
set laststatus=2 "last window always has status line
set list "turn on list chars
set listchars=tab:›-,trail:•,extends:#,nbsp:. "show tabs, trailing spaces

"searching
set ignorecase "ignore case in search
set smartcase "Use caps in search if present
set incsearch "show search as typing
set hlsearch "highlight searches

"navigation/input
set backspace=indent,eol,start
set scrolljump=5
set scrolloff=3
set mouse=a
fixdel

"other
filetype on "detect file type
filetype plugin indent on "enable automatic indenting filetype detection
syntax on "syntax aware
set tags=./tags,tags; "tags file location
set autoread "reads in changes to file outside vim
set hidden "buffers can hide

" auto remove whitespace on buffer save
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

" Turn on spell check for certain filetypes automatically
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us

"key remapping
nmap nt :NERDTreeToggle<CR>
map <leader>ntf :NERDTreeFind<CR>
nmap <leader>ntf :NERDTreeFind<CR>

nnoremap <leader>nu :NumbersToggle<CR>
nmap <leader>tb :TagbarToggle<CR>

nmap <leader>T :enew<cr> "open empty buffer
nmap <leader>l :bnext<CR> "next buffer
nmap <leader>h :bprevious<CR> "previous buffer
nmap <leader>bq :bp <BAR> bd #<CR> "close buffer
nmap <leader>b :ls<CR> "buffer status

nmap <leader>pb :CtrlPBuffer<cr>
nmap <leader>pm :CtrlPMixed<cr>
nmap <leader>pr :CtrlPMRU<cr>

nmap <leader>bt :BuffergatorToggle<CR>
" ctrlp options
let g:ctrlp_custom_ignore={
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
let g:ctrlp_working_path_mode='r' " Use the nearest .git/svn directory as the cwd

"use silver searcher for speed
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
let g:ctrlp_extensions=['tag', 'buffertag', 'undo']

"easy tags options
let g:easytags_async=1 "don't block vim

"syntastic options
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_c_checkers=['gcc']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_python_checkers=['pylint']

"airline options
let g:airline_theme='gotham'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1 "Enable the list of buffers
let g:airline#extensions#tabline#fnamemod=':t' "Show just filename

"YCM options
let g:ycm_confirm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data=['&filetype']
let g:ycm_confirm_extra_conf=0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType='<C-n>'

"Ultisnips
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
let g:UltiSnipsSnippetDirectories="~/.vim/bundle/vim-snippets/snippets"

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Setup term color support
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

"macvim transparency
if has("gui_macvim")
    set transparency=5
endif

"theme options
set background=dark
if !has('gui_running')
  let g:solarized_termcolors=16
endif
colorscheme solarized
