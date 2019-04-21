"====================== Plugins =========================="
call plug#begin()

"===> Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'myusuf3/numbers.vim'

"===> Functionality
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()


"======================= Visual =========================="
syntax on                                                 " Enable syntax
set background=dark                                       " Set dark background
set termguicolors                                         " Opaque Background
colorscheme gruvbox                                       " Set colorscheme
set number                                                " Enable line numbers
set cursorline                                            " Highlight current line
set smartcase                                             " Be smart about cases when searching
set ffs=unix,dos,mac                                      " Set Unix as standart file type
hi clear SignColumn                                       " Clear color for the gutter

"===> No arrow keys
imap <up> <nop>
imap <down> <nop>


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
set lbr
set cpoptions+=$                                          " Cool trick to show what you're replacing
set nowrap                                                " Don't wrap the text

"======================= Mapping ========================="
" Remove search highlight with return
map <Leader>bd :bd
map <leader>lg <leader><space>

" Remove highlight when fuzzy search
nnoremap <Enter> :noh<cr><esc>

" Autoindent opening and closing brackets
imap <C-Return> <CR><CR><C-o>k<Tab>

" Direcories
nmap <leader>ev :e /home/tobiaslans/dotfiles/nvim/init.vim<CR>

" Folding
nnoremap <Space> zA

" Vertical/Horizontal split
nnoremap <leader>vs <C-w>v
nnoremap <leader>hs <C-w>s

" Toggle NERDTree
map <C-b> :NERDTreeToggle<cr>
"
" Create tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>te :Te<CR>

" Toggle tabs
nnoremap <left> gT
nnoremap <right> gt

" Resize panes
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR><Paste>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Toggle background
nnoremap <silent> <leader>to :call BgToggle()<cr>


"=================== Plugin Settings ====================="
"===> gruvbox
let g:gruvbox_bold = 0

"===> deoplete
let g:deoplete#enable_at_startup = 0

"===> Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

"===> TagBar
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']
nmap <F8> :TagbarToggle<CR>

"===> fzf-vim
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o0

map <C-p> :Files<cr>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"===> Ale
let g:ale_sign_column_always = 1
hi clear ALEErrorSign
hi clear ALEWarningSign
hi link ALEErrorSign GruvboxRed
hi link ALEWarningSign GruvboxYellow
let g:ale_sign_error = '◉'
let g:ale_sign_warning = '◉'
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


"===> vim-gitgutter
let g:gruvbox_sign_column = 'bg0_h'

"====================== Functions ======================="
" Read the current hour and return string with soft, medium
" or hard contrast for e.g. gruvbox
function! SetContrastBasedOnTime(color)
    let hour = strftime("%H")
    let l:contrast = "medium"

    if (hour > 06 && hour < 20)
        let l:contrast="medium"
    else
        let l:contrast="hard"
    endif

    if (a:color == "light")
        let g:gruvbox_contrast_light = l:contrast
    else
        let g:gruvbox_contrast_dark = l:contrast
    endif
endfunction

" Set gruvbox background
function! SetGruvboxBackground(color)
    call SetContrastBasedOnTime(a:color)
    if (a:color == "light")
        set background=light
    elseif (a:color == "dark")
        set background=dark
    endif
endfunction

" Toggle dark/light gruvbox colorscheme
function! BgToggle()
    if (&background == "dark")
        call SetGruvboxBackground("light")
    elseif (&background == "light")
        call SetGruvboxBackground("dark")
    endif
endfunction
