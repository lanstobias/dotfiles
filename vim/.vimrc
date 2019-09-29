let $VTE_VERSION="100"

"======================= General ========================="
au BufRead,BufNewFile *.md setlocal textwidth=80          " Wrap lines in .md textfile
set foldmethod=syntax                                     " Folds pecified to syntax definitions
set pastetoggle=<F3>                                      " Toggle paste with F2
let mapleader = ','                                       " Map leader to ,
set encoding=UTF-8                                        " Set UTF-8 as standard
set softtabstop=4                                         " Let backspace delete indent
set textwidth=80                                          " Set width of text to 80
set ttyfast                                               " More characters will be sent to the screen for redrawing

"==> a better menu in command mode
set wildmenu
set wildmode=longest:full,full

"==> Update buffer from file
set autoread 
au FocusGained * :checktime

"==> netrw
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist

"==> Searching
set incsearch                                           " Incremental searching
set hlsearch                                            " Highlight search
set ignorecase                                          " Search are case insensitive...
set smartcase                                           " ...unless they contain atleast one capital

"======================= Editor =========================="
set foldmethod=marker                                     " Folds pecified to syntax definitions
set ffs=unix,dos,mac                                      " Set Unix as standart file type
set shiftwidth=4                                          " Use indents of 4 spaces
set nojoinspaces                                          " Prevents inserting two spaces after punctuation on a join
set textwidth=99                                          " Set width of text to 99
set scrolloff=5                                           " Keep 5 lines above and below while scrolling
set splitbelow                                            " Horizontal split below current
set splitright                                            " Vertical split to right of current
set autoindent                                            " Indent at the same level of the previous lines
set expandtab                                             " Tabs are spaces, not tabs
set smartcase                                             " Be smart about cases when searching
set tabstop=4                                             " An indentation every four columns
set showmatch                                             " Show matching braces
set mouse=n                                               " Enable mouse
set nowrap                                                " Don't wrap the text
set lbr                                                   " Cut lines between words when wrap is enabeled
set ai                                                    " Auto indent
set si                                                    " Smart indent


"======================= Mapping ========================="
" Remove highlight when fuzzy search
nnoremap <Enter> :noh<cr><esc>

" Autoindent opening and closing brackets
imap <C-Return> <CR><CR><C-o>k<Tab>

"toggle netrw on the left side of the editor
nnoremap <leader>n :Lexplore<CR>

" Direcories
nmap <leader>ev :e ~/dotfiles/nvim/init.vim<CR>

" Vertical/Horizontal split
nnoremap <leader>vs <C-w>v
nnoremap <leader>hs <C-w>s

" Create jtabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>te :Te<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Cycle tabs with Shift
nnoremap H gT
nnoremap L gt

" Terminal
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif
nnoremap <leader>tt :vsplit term://zsh<CR>


"======================= Visual ==========================
syntax enable
"colorscheme darkblue                                         " Colorscheme (valid comment)
"set background=dark                                       " Set dark background
set colorcolumn=+1                                        " Color column 100
"set termguicolors                                         " Opaque Background
set linespace=3                                           " Space between lines
set cursorline                                            " Highlight current line
"set t_Co=256                                              " Use 256 colors in terminal
set number                                                " Enable line numbers
set laststatus=2                                          " Always display 2 status line
set statusline=%=%m\ %c\ %P\ %f                           " modifiedflag, charcount, filepercent, filepath

hi Folded guibg=NONE ctermbg=NONE
hi CursorLine cterm=NONE ctermbg=238
hi ColorColumn ctermbg=238


"======================= Visual ==========================
source $HOME/dotfiles/vim/.vim/statusline.vim

