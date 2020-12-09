"=============================== General ======================================"
let g:mapleader = ","                                                            " Map leader to ,
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
set guifont=Iosevka
let g:ruby_host_prog = '/usr/local/bin/neovim-ruby-host'

"===> Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


"================================ Sources ====================================="
 source ~/dotfiles/nvim/settings/plugins.vim


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
set laststatus=2                                                               " Height of statusline
set colorcolumn=80                                                             " Highlight column 80
set cursorline                                                                 " Highlight the screen line of the cursor
set noshowmode                                                                 " Hide last line under mode

" Always show signcolumn
set signcolumn=yes

"===> Colors
"hi CursorLine ctermbg=NONE guibg=#222222
"hi CursorLineNr guifg=#b7cbf4
"hi ColorColumn ctermbg=236 guibg=#222222
"hi Folded ctermbg=236 guibg=#282828
"hi SignColumn ctermbg=237 guibg=#121212
"hi LineNr guibg=#121212 guifg=#444444

"===> Diffcolors
hi DiffDelete gui=none guifg=#fb4934 guibg=#420909
hi DiffAdd gui=none guifg=#61d13d guibg=#012900
hi DiffChange gui=none guifg=none guibg=#213147
hi DiffText gui=none guifg=#ffffff guibg=#536ba6

"===> netrw
let g:netrw_banner = 0
let g:netrw_altv=1


"=============================== Editor ======================================="
set tabstop=4                                                                  " Number of spaces that <Tab> counts for
set shiftwidth=3                                                               " Indentation via >>
set expandtab                                                                  " Use spaces
let g:vim_json_syntax_conceal = 0                                              " Show all characters in json files
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o      " Set formatting

"===> Smart insert mode
if has('nvim')
    autocmd TermOpen term://* startinsert
endif

set conceallevel=0

"========================= Language Specific =================================="
"au! BufNewFile,BufReadPost *.md set filetype=markdown
"au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


"============================== Mappings ======================================"
"===> Splits
nnoremap <Leader>hs :split<CR>
nnoremap <Leader>vs :vsplit<CR>

"===> Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <S-h> :tabprevious<CR>
nnoremap <S-l> :tabnext<CR>

"===> Direcories
nmap <leader>ev :e ~/dotfiles/vim/.vimrc<CR>
nmap <leader>ep :e ~/dotfiles/nvim/settings/plugins.vim<CR>

"===> Movement
let g:BASH_Ctrl_j = 'off'
" Scroll horizontally
map <C-L> 20zl
map <C-H> 20zh

" Terminal mode
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l

"===> Yank/Put
" Copy to system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Put without yanking (you do that with <leader>p now asshole)
vnoremap <leader>p p
vnoremap p "_dP

"===> Other
" Clear search highlight
nnoremap <silent> <CR> :nohlsearch<CR><C-L>

" Paste in the beginning of line
nnoremap <leader>p 0i<space><esc>pa<space><esc>0x

" Open netrw
nnoremap - :e dummynetrwbuf \| Explore \| bw! dummynetrwbuf <CR>

" Start terminal mode
nmap <Leader>tt :terminal<CR>

"===> Ctags
nnoremap <Leader>gd :only<bar>vsplit<CR>gd

"===> F-keys
map <F8> :set ignorecase! ignorecase?<CR>
map <F2> <Plug>(coc-definition)
map <F4> :call CurtineIncSw()<CR>
nmap <F8> :TagbarToggle<CR>


"=============================== Functions ===================================="
filetype plugin indent on


"============================== Status line ==================================="
set laststatus=2
set statusline=
set statusline+=%1*                                                            " Color (white) ---->
set statusline+=%{StatuslineMode()}                                            " Mode

set statusline+=\ %{fugitive#statusline()}

set statusline+=\ %f                                                           " File
set statusline+=\ %h%m%r%w                                                     " Flags

set statusline+=%=                                                             " Right align

set statusline+=[%{strlen(&ft)?&ft:'none'},                                    " Filetype
set statusline+=\ %{strlen(&fenc)?&fenc:&enc},                                 " Encoding
set statusline+=\ %{&fileformat}]                                              " Fileformat

set statusline+=\ %p%%
set statusline+=\ %l:%c                                                        " Cursor line:column

hi User1 ctermbg=black ctermfg=white guibg=#32302f guifg=#ebdbb2
hi User2 ctermbg=lightgreen ctermfg=black guibg=default guifg=white
hi User3 ctermbg=black ctermfg=lightblue guibg=black guifg=lightblue
hi User4 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
hi User5 ctermbg=black ctermfg=magenta guibg=black guifg=magenta

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
     return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction
