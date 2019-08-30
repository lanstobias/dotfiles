"====================== Plugins =========================="
call plug#begin()
"===> Visual
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'shinchu/lightline-gruvbox.vim'

"===> Functionality
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'reedes/vim-pencil'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'junegunn/goyo.vim'
Plug 'pseewald/vim-anyfold'
Plug 'sheerun/vim-polyglot'
Plug 'wakatime/vim-wakatime'
call plug#end()

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


"=================== Plugin Settings ====================="
"===> gruvbox
let g:gruvbox_bold = 1
let g:gruvbox_sign_column = "bg0"
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "soft"

"===> badwolf
let g:badwolf_darkgutter = 0

"===> TagBar
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']
nmap <F8> :TagbarToggle<CR>

"===> fzf-vim
nnoremap <C-g> :GFiles<Cr>
nnoremap <C-p> :History<CR>
nnoremap <C-o> :Files<Cr>
nnoremap <C-b> :Buffers<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
let g:fzf_layout = { 'down': '~40%' }

"===> coc
source ~/dotfiles/nvim/coc_settings.vim

"===> NERDTree
map <F2> :NERDTreeToggle<cr>

"===> lightline
source ~/dotfiles/nvim/lightline.vim

"===> vim-easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"===> Pencil
let g:pencil#textwidth = 80
augroup pencil
  autocmd!
  autocmd FileType text         call pencil#init({'wrap': 'hard', 'autoformat': 0})
  autocmd FileType markdown,mkd call pencil#init()
augroup END

"===> vim-arduino
nnoremap <buffer> <leader>av :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>aus :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>acb :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

"===> incsearch
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

"====> incsearch-easymotion
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

"===> vim-fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>ga :Git add %:p<CR><CR>

"===> vim-gitgutter
let g:gitgutter_enabled = 1
nnoremap <leader>tgg :GitGutterToggle<CR>

"===> vim-startify
source ~/dotfiles/nvim/startify.vim

"===> vim-notes
let g:notes_directories = ['~/dropbox/notes', '~/notes']
let g:notes_suffix = '.md'

"===> goyo
nnoremap <leader>go :Goyo<CR>
let g:goyo_width = 120
let g:goyo_height = 90

"===> vim-anyfold
filetype plugin indent on
autocmd Filetype * AnyFoldActivate
set foldlevel=99
let g:anyfold_fold_comments=1


"======================= Visual ==========================
set background=dark                                       " Set dark background
hi clear SignColumn                                       " Clear color for the gutter
colorscheme gruvbox                                       " Colorscheme (valid comment)
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


"===================== Functions =========================
"===> Goyo
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"===> Guvbox
" Toggle dark/light gruvbox colorscheme
function! BgToggle()
    if (&background == "dark")
        set background=light
    elseif (&background == "light")
        set background=dark
    endif
endfunction
