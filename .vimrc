set autoindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set smarttab
set scrolloff=5
set expandtab
set autoread
set ignorecase
set smartcase
set number
set incsearch
set hlsearch
set nolazyredraw
set wildmode=longest,list
set showmatch
set noerrorbells
set novisualbell
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set magic
set nowrap

syntax enable
filetype plugin on
filetype indent on

"Persistent undo
try
  if MySys() == "windows"
    set undodir=C:\Windows\Temp
  else
    set undodir=~/.vim_runtime/undodir
  endif

  set undofile
catch
endtry

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Map Ctrl + h to previous tab and Ctrl + l to next tab 
nmap <C-H> :tabprev<CR>
nmap <C-L> :tabnext<CR>

iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
