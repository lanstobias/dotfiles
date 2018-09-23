"====================== Sources ========================"
source ~/.vim/plugins.vi
source ~/.vim/mappings.vi

"====================== General ========================"
let mapleader = ","                                     " Map leader to ,
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

" ==> Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ==> No arrow keys
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"=================== Editor Visuals ===================="
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
highlight ColorColumn guibg=#292929
call matchadd('ColorColumn', '\%100v', 100)             " Only the lines that go over
let &colorcolumn=join(range(100,999),",")               " Different color past 100 characters

"=================== Colors and Fonts =================="
syntax enable                                           " Eneble use of syntax highlighting
colorscheme badwolf                                     " Set colorscheme
set t_Co=256                                            " Use 256 colors

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

 "====================== Functions ======================="
 "" Create parent direcotries if they doesn't exist
 function s:MkNonExDir(file, buf)
     if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
	     let dir=fnamemodify(a:file, ':h')
	     if !isdirectory(dir)
		 call mkdir(dir, 'p')
	     endif
     endif
endfunction
