"====================== Plugins =========================="
call plug#begin()
"===> Visual
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-wombat-scheme'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sjl/badwolf'
Plug '844196/lightline-badwolf.vim'

"===> Functionality
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'reedes/vim-pencil'
Plug 'stevearc/vim-arduino'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

" --> fzf
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'

Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'

call plug#end()


"======================= General ========================="
au BufRead,BufNewFile *.md setlocal textwidth=80          " Wrap lines in .md textfile
set foldmethod=syntax                                     " Folds pecified to syntax definitions
let mapleader = ','                                       " Map leader to ,
set encoding=UTF-8                                        " Set UTF-8 as standard
set softtabstop=4                                         " Let backspace delete indent
set textwidth=80                                          " Set width of text to 80
set shiftwidth=4                                          " Use indents of 4 spaces
set nojoinspaces                                          " Prevents inserting two spaces after punctuation on a join
set scrolloff=5                                           " Keep 5 lines above and below while scrolling
set splitbelow                                            " Horizontal split below current
set splitright                                            " Vertical split to right of current
set autoindent                                            " Indent at the same level of the previous lines
set expandtab                                             " Tabs are spaces, not tabs
set tabstop=4                                             " An indentation every four columns
set showmatch                                             " Show matching braces
set mouse=n                                               " Enable mouse
set nowrap                                                " Don't wrap the text
set lbr                                                   " Cut lines between words when wrap is enabeled
set ai                                                    " Auto indent
set si                                                    " Smart indent


"======================= Mapping ========================="
" Autoindent opening and closing brackets
imap <C-Return> <CR><CR><C-o>k<Tab>

" Direcories
nmap <leader>ev :e ~/dotfiles/nvim/init.vim<CR>

" Folding
nnoremap <Space> zA

" Vertical/Horizontal split
nnoremap <leader>vs <C-w>v
nnoremap <leader>hs <C-w>s

" Create tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>te :Te<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Cycle tabs with Shift
nnoremap H gT
nnoremap L gt


"=================== Plugin Settings ====================="
"===> gruvbox
let g:gruvbox_bold = 1
let g:gruvbox_sign_column = "bg0"
let g:gruvbox_contrast_dark = "hard"

"===> badwolf
let g:badwolf_darkgutter = 0

"===> YCM
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
set completeopt-=preview
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

"===> TagBar
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']
nmap <F8> :TagbarToggle<CR>

"===> fzf-vim
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-+> :Files<Cr>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
let g:fzf_layout = { 'down': '~40%' }

"===> Ale
let g:ale_sign_column_always = 1
hi clear ALEErrorSign
hi clear ALEWarningSign
"hi link ALEErrorSign GruvboxRed
"hi link ALEWarningSign GruvboxYellow
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let g:ale_echo_msg_error_str = '✖ Error'
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_open_list = 0
let g:ale_set_highlights = 1
let g:ale_linters = {
\   'c': ['cppcheck'],
\}
nnoremap <leader>er :let ale_open_list<CR>

"===> NERDTree
map <C-b> :NERDTreeToggle<cr>

"===> lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
let g:lightline.colorscheme = 'badwolf'

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
  autocmd FileType text         call pencil#init()
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


"======================= Visual =========================="
syntax on                                                 " Enable syntax
set background=dark                                       " Set dark background
set termguicolors                                         " Opaque Background
colorscheme badwolf                                       " Set colorscheme
set number                                                " Enable line numbers
set cursorline                                            " Highlight current line
set smartcase                                             " Be smart about cases when searching
set ffs=unix,dos,mac                                      " Set Unix as standart file type
hi clear SignColumn                                      " Clear color for the gutter
set colorcolumn=+1                                        " Color column 100
set linespace=3                                           " Space between lines
set noshowmode                                            " Hide active mode in status bar
set hlsearch

"===> Color settings (Old gruvbox settings)
"hi ColorColumn guibg=#282828
"hi CursorLine term=bold cterm=bold guibg=#282828
"hi Folded guibg=#282828
"hi CursorLineNr guibg=#282828
