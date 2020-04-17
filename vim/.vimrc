"================================ Sources ====================================="
 source ~/dotfiles/nvim/settings/plugins.vim


"=============================== General ======================================"
let mapleader = ","                                                            " Map leader to ,
set mouse=n                                                                    " Enable mouse
set encoding=utf8                                                              " Set default encoding to UTF-8 instead of latin1
set history=50                                                                 " Sets how many lines of history VIM remembers
set autoread                                                                   " Set to auto read when a file is changed from the outside
set directory^=$HOME/.vim/tmp//                                                " Store backups in tmp directoru instead of ~
set belloff=all                                                                " No bells..
set ffs=unix,dos,mac                                                           " Use Unix as the standard file type
set splitright                                                                 " Always split window to the right
set noswapfile                                                                 " Disable swapfiles
set ttimeout                                                                   " ttimeout mode active, will wait ttimeoutlen for a key to follow
set ttimeoutlen=100                                                            " Wait milliseonds for terminal to complete key code sequence
set timeoutlen=3000                                                            " Wait milliseconds for mapped sequence to complete
set nowrap                                                                     " Do not wrap text

"===> Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


"=============================== Visual ======================================="
"===> Set appropriate color mode
if (has("termguicolors"))
   set termguicolors                                                           " Set 24-bit true color
else
   set t_Co=256                                                                " Set 256 colors
endif

syntax enable                                                                  " Eneble use of syntax highlighting
colorscheme gruvbox                                                            " Set colorscheme
set background=dark                                                            " Default dark colorscheme
set number                                                                     " Activates line numbers
set mat=2                                                                      " How many tenths of a second to blink when matching brackets
set ruler                                                                      " Always show current position
set textwidth=80                                                               " 80 character text witdh
set laststatus=2                                                               " Height of statusline
set colorcolumn=80                                                             " Highlight column 80
set cursorline                                                                 " Highlight the screen line of the cursor
set noshowmode                                                                 " Hide last line under mode

"===> Error/GIT gutter always visible
augroup mine
    au BufWinEnter * sign define mysign
    au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
augroup END

"===> Colors
hi CursorLine ctermbg=NONE guibg=#282828
hi CursorLineNr guifg=#fe8019
hi ColorColumn ctermbg=236 guibg=#282828
hi Folded ctermbg=236 guibg=#282828
hi SignColumn ctermbg=237 guibg=#282828

"===> Diffcolors
hi DiffDelete gui=none guifg=#fb4934 guibg=#590003
hi DiffAdd gui=none guifg=none guibg=#2a4a0d
hi DiffChange gui=none guifg=none guibg=#043740
hi DiffText gui=none guifg=none guibg=#32523e

"===> netrw
let g:netrw_banner = 0
let g:netrw_altv=1


"=============================== Editor ======================================="
set tabstop=4                                                                  " Number of spaces that <Tab> counts for
set shiftwidth=3                                                               " Indentation via >>
set expandtab                                                                  " Use spaces
let g:vim_json_syntax_conceal = 0                                              " Show all characters in json files
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o      " Set formatting


"========================= Language Specific =================================="
au! BufNewFile,BufReadPost *.md set filetype=markdown
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


"============================== Mappings ======================================"
"===> Splits
nnoremap <Leader>hs :split<CR>
nnoremap <Leader>vs :vsplit<CR>

"===> Direcories
nmap <leader>ev :e ~/dotfiles/vim/.vimrc<CR>
nmap <leader>ep :e ~/dotfiles/nvim/settings/plugins.vim<CR>

"===> Movement
let g:BASH_Ctrl_j = 'off'
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

"===> Other
" Clear search highlight
nnoremap <silent> <CR> :nohlsearch<CR><C-L>

" Paste in the beginning of line
nnoremap <leader>p 0i<space><esc>pa<space><esc>0x

" Copy to clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Open netrw
nnoremap - :e dummynetrwbuf \| Explore \| bw! dummynetrwbuf <CR>

"===> Ctags
nnoremap <Leader>gd :only<bar>vsplit<CR>gd

"===> F-keys
map <F8> :set ignorecase! ignorecase?<CR>
map <F2> <Plug>(coc-definition)
map <F4> :call CurtineIncSw()<CR>
nmap <F8> :TagbarToggle<CR>


"=============================== Functions ===================================="

filetype plugin indent on
