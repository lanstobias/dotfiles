"============================ Plugin Manager =================================="
" Auto install plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

"==> Visual
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
@Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/conflict-marker.vim'
Plug 'Yggdroot/indentLine'

"==> IDE-like functionalities
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'dominikduda/vim_current_word'
"Plug 'dense-analysis/ale'
"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }


"==> Editor
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'

"==> Other
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'embear/vim-localvimrc'
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()


"================================ Settings ===================================="
"===> Gruvbox
let g:gruvbox_invert_selection=0
let g:gruvbox_invert_signs=0
let g:gitgutter_override_sign_column_highlight=1
let g:gruvbox_contrast_dark='hard'

"===> vim_current_word
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 0
let g:vim_current_word#highlight_delay = 1000
let g:vim_current_word#highlight_only_in_focused_window = 1
hi CurrentWord guibg=#3E3D32 gui=NONE ctermbg=237 cterm=NONE
hi CurrentWordTwins guibg=#3E3D32 gui=NONE ctermbg=237 cterm=NONE

"===> coc-explorer
let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Use preset argument to open it
nmap <C-n> :CocCommand explorer<CR>
nmap <Leader>ef :CocCommand explorer --preset floating<CR>

"===> Goyo
map <Leader>gy :Goyo<CR>

"===> Ale
let g:ale_disable_lsp = 1
let g:ale_c_parse_compile_commands = 1

"===> TaskList
map <Leader>ts :TaskList<CR>


"===> Easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)


"===> incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


"===> vim--localvimrc
let g:localvimrc_whitelist = [
         \ '/home/ubuntu/stash/lhd_shell/master/.lvimrc',
         \ '/home/ubuntu/stash/lhd_shell/release_tm6_new/.lvimrc'
         \ ]

"===> orgmode
let g:org_agenda_files = ['~/org/index.org','~/org/projects.org']


"===> indentLine
let g:indentLine_color_term = 237                                              " Vim
let g:indentLine_color_gui = "#3c3836"                                         " Gvim
let g:indentLine_color_tty_light = 7                                           " None X terminal (default 4)
let g:indentLine_color_dark = 1                                                " None X terminal (default 4)
let g:indentLine_bgcolor_gui = "NONE"
let g:indentLine_char = '¦'


"===> Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gbr :Gbranch<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gds :Gdiffsplit!<CR>
nnoremap <leader>gm :Git mergetool<CR>
nnoremap gdh :diffget //2 <bar> diffupdate<CR>
nnoremap gdl :diffget //3 <bar> diffupdate<CR>
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

"===> vim-tmux-navigator
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-o> :TmuxNavigatePrevious<cr>

"===> fzf / fzf-mru
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif
" Window
"let g:fzf_preview_window = '' 
"if has('nvim-0.4.0') || has("patch-8.2.0191")
    "let g:fzf_layout = { 'window': {
                "\ 'width': 0.7,
                "\ 'height': 0.4,
                "\ 'highlight': 'Comment',
                "\ 'rounded': v:true } }
"else
    "let g:fzf_layout = { "window": "silent botright 16split enew" }
"endif

" Functions
function! s:find_git_root()
  return system('(git rev-parse --show-superproject-working-tree --show-toplevel | head -1) 2> /dev/null')[:-2]
endfunction

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" Find word under cursor
command! -bang -nargs=* FindWordUnderCursor
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(expand('<cword>')), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

" Commands
command! ProjectFiles execute 'Files' s:find_git_root()
command! Rgt call fzf#vim#tags(expand('<cword>'))

" Match only file content
command! -bang -nargs=* Rgc call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -nargs=1 -bang Locate call fzf#run(fzf#wrap({'source': 'locate .', 'options': '-m'}, <bang>0))

command! -bang -nargs=* RGW
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%:hidden', '?'),
  \   <bang>0)

" History
command! FZFMru call fzf#run({'source': v:oldfiles, 'sink': 'e', 'options': '-m -x +s'})

" Rg
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
command! -nargs=1 -bang Locate call fzf#run(fzf#wrap({'source': 'locate <q-args>', 'options': '-m'}, <bang>0))

" conflict-marker
highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e

" Mappings
nnoremap <silent><C-p> :ProjectFiles<cr>
nnoremap <silent><C-b> :Buffers<cr>
nnoremap <silent><C-g> :GFiles?<cr>
nnoremap <silent><C-h> :History<cr>
nnoremap <silent><Leader>rg :RG<cr>
nnoremap <silent><Leader>fw :FindWordUnderCursor<cr>

"===> LSP
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
      \ 'cpp': ['opt/qtcreator-4.1.0/libexec/qtcreator/clang/bin/clang']
    \ }


"===> coc
let g:coc_user_config = {
      \ 'languageserver': {
         \ 'clangd': {
         \     'command': '/usr/bin/clangd',
         \     'filetypes': ['c', 'cpp'],
         \     'initializationOptions': {
         \         'cache': {'directory': '/tmp'},
         \         'index': {'threads': 8},
         \         }
         \     }
         \ }
      \ }

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
let g:LanguageClient_serverCommands = {
 \ 'cpp': ['clangd', '-background-index',],
 \ }

let g:LanguageClient_serverStderr = '/tmp/clangd.stderr'

function SetLSPShortcuts()
  " ...
  " Previous bindings
  " ...
  nnoremap <leader>ll :call LanguageClient#debugInfo()<CR>
endfunction()

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Jump to definition
"noremap <F2> :call CocAction('jumpDefinition')<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
