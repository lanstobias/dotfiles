"============================ Plugin Manager =================================="
" Auto install plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Installed plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'jceb/vim-orgmode'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/todolist.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pbogut/fzf-mru.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'sheerun/vim-polyglot'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'airblade/vim-rooter'
Plug 'samoshkin/vim-mergetool'
Plug 'sjl/badwolf'
call plug#end()


"================================ Settings ===================================="
"===> Gruvbox
let g:gruvbox_invert_selection=0
let g:gruvbox_invert_signs=0
let g:gitgutter_override_sign_column_highlight=1
let g:gruvbox_contrast_dark='hard'

"===> vimwiki
au BufRead,BufNewFile *.wiki set filetype=vimwiki
let g:vimwiki_list = [
                        \{'path': '~/notes/work.wiki', 
                         \'path_html': '~/notes/html',
                         \'syntax': 'markdown', 'ext': '.md'},
                        \{'path': '~/notes/logg.wiki',
                         \'syntax': 'markdown', 'ext': '.md'}
                    \]
autocmd FileType vimwiki map <Leader>d :VimwikiMakeDiaryNote


"===> NERDtree
map <C-n> :NERDTreeToggle %<CR>
let g:NERDTreeChDirMode = 2


"===> Goyo
map <Leader>gy :Goyo<CR>


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


"===> incsearch-fuzzy
map / <Plug>(incsearch-fuzzy-/)
map ? <Plug>(incsearch-fuzzy-?)
map g/ <Plug>(incsearch-fuzzy-stay)


"===> orgmode
let g:org_agenda_files = ['~/org/index.org','~/org/projects.org']


"===> indentLine
let g:indentLine_color_term = 237                                              " Vim
let g:indentLine_color_gui = "#3c3836"                                         " Gvim
let g:indentLine_color_tty_light = 7                                           " None X terminal (default 4)
let g:indentLine_color_dark = 1                                                " None X terminal (default 4)
let g:indentLine_bgcolor_gui = "NONE"
let g:indentLine_char = '¦'


"===> lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


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


"===> fzf / fzf-mru
if has("nvim")
    " Escape inside a FZF terminal window should exit the terminal window
    " rather than going into the terminal's normal mode.
    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif
if has("nvim") && 0
   let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
else
   let g:fzf_layout = { 'down': '~20%' }
endif
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-g> :GFiles<cr>
nnoremap <silent> <C-k> :Rg<cr>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
xnoremap <silent> <Leader>agy :Ag <C-R>"<CR>
nnoremap <silent> <Leader>mrp :FZFMru<cr>
nnoremap <silent> <Leader>mrp :FZFMru<cr>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
command! Rgw call fzf#vim#tags(expand('<cword>'))

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" Match only file content
command! -bang -nargs=* Rgc call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
      \ {'source': 'locate .', 'options': '-m'}, <bang>0))

" History
command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

" Open files in vertical horizontal split
nnoremap <silent> <Leader>fv :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
      \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))


"===> coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
