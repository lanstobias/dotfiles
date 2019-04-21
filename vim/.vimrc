"====================== Sources ========================"
source ~/.vim/plugins.vi

"====================== General ========================"
let mapleader = ","                                     " Map leader to ,
set mouse=n                                             " Enable mouse
set encoding=utf8                                       " Set default encoding to UTF-8 instead of latin1
set history=50	                                        " Sets how many lines of history VIM remembers
set autoread                                            " Set to auto read when a file is changed from the outside
set smartcase                                           " When searching try to be smart about cases
set hlsearch                                            " Highlight search results
set lazyredraw                                          " Don't redraw while executing macros (good performance config)
set directory^=$HOME/.vim/tmp//                         " Store backups in tmp directoru instead of ~
set encoding=utf8                                       " Set utf8 as standard encoding and EN as the standard language
set autowriteall                                        " Save the file when switch buffer
set belloff=all                                         " No bells..
set scrolloff=5                                         " Keep 5 lines above and below cursor when scrolling in file
set ffs=unix,dos,mac                                    " Use Unix as the standard file type
set hidden                                              " Makes vim work like every other multiple-file editor
set autochdir                                           " Auto change directory to file
set ff=unix
set foldmethod=syntax                                   " Folds are defined by a user-defined expression
set foldlevelstart=99                                   " Don't start new buffers folded

"==> Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==> No arrow keys
imap <up> <nop>
imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

"===================== Colorscheme ====================="
"==> True colors
if (has("termguicolors"))
    set termguicolors
endif

syntax enable                                           " Eneble use of syntax highlighting
set background=dark                                     " Default dark colorscheme
colorscheme gruvbox                                     " Set colorscheme

"=================== Editor Visuals ===================="
set t_Co=256                                            " Use 256 colors
set number                                              " Activates line numbers
set cursorline                                          " Highlight current line
set mat=2                                               " How many tenths of a second to blink when matching brackets
set relativenumber                                      " Show relative line numbers
set ruler                                               " Always show current position
set textwidth=99                                        " 120 character text witdh (80 is
set laststatus=2                                        " Height of statusline
set nowrap                                              " Do not wrap text that expand beyond 120 chars
set splitright                                          " Always split window to the right
set incsearch                                           " Highlight fuzzy search
set linespace=2

"==> Error/GIT gutter always visible
augroup mine
    au BufWinEnter * sign define mysign
    au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
augroup END

"==> Warn when lines go beyond 99 chars
highlight ColorColumn ctermbg=red
"call matchadd('ColorColumn', '\%100v', 100)             " Only the lines that go over
"let &colorcolumn=join(range(100,999),",")               " Different color past 100 characters

"==> Line highlight
highlight CursorLine term=bold ctermbg=red

"============ Text, tabs and indent related ============"
set expandtab                                           " Use spaces instead of tabs
set smarttab                                            " Be smart when using tabs
set ai                                                  " Auto indent
set si                                                  " Smart indent

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

"=============== Files, backups and undo ==============="
"" Turn backup off, since most stuff is in git anyway..
set nobackup
set nowb
set noswapfile

"================ Mappings ==================
"===> Editor
map <silent> <leader><cr> :noh<cr>
map <Leader>bd :bd
map <leader>lg <leader><space>

" Vertical/Horizontal split
nnoremap <leader>vs <C-w>v
nnoremap <leader>hs <C-w>s

" Autoindent opening and closing brackets
imap <C-Return> <CR><CR><C-o>k<Tab>

" Edit another file in the same directory as the current file
"      uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :vsp <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

"===> Direcories
nmap <leader>ev :e /home/tobiaslans/dotfiles/vim/.vimrc<CR>
nmap <leader>ep :e /home/tobiaslans/dotfiles/vim/.vim/plugins.vim<CR>
nmap <leader>epr :e /home/tobiaslans/dotfiles/vim/.vim/projects.vim<CR>
map <Leader>dr :e /home/tobiaslans/Dropbox/
map <Leader>oru :e /home/tobiaslans/Dropbox/oru/

"===> Buffers
map <leader>db :bd<cr>

"===> Folding
nnoremap <Space> zA

"===> Window management
map <C-b> :NERDTreeToggle<cr>
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" Tabs
nnoremap <Esc>^[[D :tabprevious<CR>
nnoremap <Esc>^[[C :tabnext<CR>
nnoremap <leader>te :te<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"===> Visual
" Remove highlight when fuzzy search
nnoremap <Enter> :noh<cr><esc>

" Toggle background
nnoremap <silent> <leader>to :call BgToggle()<cr>

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

" Create parent direcotries if they doesn't exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
	    if !isdirectory(dir)
            call mkdir(dir, 'p')
	    endif
    endif
endfunction

"====================== Includes ======================="
source ~/.vim/mappings.vi

"====================== Executes ======================="
call SetContrastBasedOnTime(&background)                
