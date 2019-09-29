let $VTE_VERSION="100"


"======================= General ========================="
au BufRead,BufNewFile *.md setlocal textwidth=80          " Wrap lines in .md textfile
set foldmethod=syntax                                     " Folds pecified to syntax definitions
set pastetoggle=<F3>                                      " Toggle paste with F2
let mapleader = ','                                       " Map leader to ,
set encoding=UTF-8                                        " Set UTF-8 as standard
set softtabstop=4                                         " Let backspace delete indent
set textwidth=80                                          " Set width of text to 80

"==> Update buffer from file
set autoread 
au FocusGained * :checktime


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

nnoremap <leader>to :call BgToggle()<CR>

" Autoindent opening and closing brackets
imap <C-Return> <CR><CR><C-o>k<Tab>

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

" Open startify
map <leader>st :Startify<CR>

" Terminal
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif
nnoremap <leader>tt :vsplit term://zsh<CR>


"======================= Visual ==========================
set background=dark                                       " Set dark background
hi clear SignColumn                                       " Clear color for the gutter
"colorscheme gruvbox                                       " Colorscheme (valid comment)
set colorcolumn=+1                                        " Color column 100
set termguicolors                                         " Opaque Background
set cmdheight=1                                           " Set space below statusline to 1
set linespace=3                                           " Space between lines
set cursorline                                            " Highlight current line
set noshowmode                                            " Hide active mode in status bar
set t_Co=256                                              " Use 256 colors in terminal
set number                                                " Enable line numbers
syntax on                                                 " Enable syntax
hi Folded guibg=NONE ctermbg=NONE
