"====================== Plugins =========================="
call plug#begin()

"===> Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'myusuf3/numbers.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sjl/badwolf'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


"===> Functionality
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'easymotion/vim-easymotion'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'terryma/vim-multiple-cursors'

" --> fzf
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'

Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'

call plug#end()


"======================= General ========================="
let mapleader = ','                                       " Map leader to ,
set mouse=n                                               " Enable mouse
set encoding=UTF-8                                        " Set UTF-8 as standard


"======================= Editor =========================="
set autoindent                                            " Indent at the same level of the previous lines
set shiftwidth=4                                          " Use indents of 4 spaces
set expandtab                                             " Tabs are spaces, not tabs
set tabstop=4                                             " An indentation every four columns
set softtabstop=4                                         " Let backspace delete indent
set showmatch                                             " Show matching braces
set ai                                                    " Auto indent
set si                                                    " Smart indent
set nojoinspaces                                          " Prevents inserting two spaces after punctuation on a join
set splitbelow                                            " Horizontal split below current
set splitright                                            " Vertical split to right of current
set scrolloff=5                                           " Keep 5 lines above and below while scrolling
set nowrap                                                " Don't wrap the text
set textwidth=99                                          " Set width of text to 99
set foldmethod=syntax                                     " Folds pecified to syntax definitions
set foldlevel=99                                          " Open files unfolded
set lbr


"======================= Mapping ========================="
" Remove search highlight with return
map <Leader>bd :bd
map <leader>lg <leader><space>

" Remove highlight when fuzzy search
nnoremap <Enter> :noh<cr><esc>

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

"===> deoplete
let g:deoplete#enable_at_startup = 1
let g:auto_complete_delay = 0
let g:completor_min_chars = 1

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
hi link ALEErrorSign GruvboxRed
hi link ALEWarningSign GruvboxYellow
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

"===> vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#ale#enabled = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'gruvbox'

"===> vim-easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

"===> vim-signify
let g:signify_vcs_list = ['git']
let g:signify_realtime = 1
let g:signify_sign_show_count = 0
nnoremap <leader>gt :SignifyToggle<CR>


"======================= Visual =========================="
syntax on                                                 " Enable syntax
"set t_Co=256
set background=dark                                       " Set dark background
"set termguicolors                                         " Opaque Background
colorscheme gruvbox                                       " Set colorscheme
set number                                                " Enable line numbers
set cursorline                                            " Highlight current line
set smartcase                                             " Be smart about cases when searching
set ffs=unix,dos,mac                                      " Set Unix as standart file type
hi clear SignColumn                                       " Clear color for the gutter
set colorcolumn=+1                                        " Color column 100
set linespace=3
hi ColorColumn guibg=#282828
hi CursorLine term=bold cterm=bold guibg=#282828
hi Folded guibg=#282828
hi CursorLineNr guibg=#282828


"====================== Functions ======================="
" Toggle dark/light gruvbox colorscheme
function! BgToggle()
    if (&background == "dark")
        let g:gruvbox_sign_column = "bg0"
        let g:gruvbox_contrast_light = "medium"
        set background=light
    elseif (&background == "light")
        let g:gruvbox_sign_column = "bg0"
        let g:gruvbox_contrast_dark = "hard"
        set background=dark
    endif
endfunction

nnoremap <silent> <leader>to :call BgToggle()<cr>

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
