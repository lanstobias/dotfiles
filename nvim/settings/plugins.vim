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
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'majutsushi/tagbar'
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

"===> NerdTree
nmap <silent> <C-n> :NERDTreeFind<cr>


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


"===> incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


"===> vim--localvimrc
let g:localvimrc_whitelist='/home/ubuntu/stash/lhd_shell/release_tm6_new/*'


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

nnoremap <silent><leader>f :FZF -q <C-R>=expand("<cword>")<CR><CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

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

" Mappings
nnoremap <silent> <C-p> :ProjectFiles<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-g> :GFiles?<cr>
nnoremap <silent> <Space> :History<cr>
nnoremap <silent> <Leader>rg :RG<cr>
nnoremap <silent> <Leader>lo :Locate<cr>
nnoremap <silent> <D-S-F> :RG
map <F6>:FindWordUnderCursor<cr>

