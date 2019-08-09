function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" List commits for vim-startify
function! s:list_commits()
let git = 'git -C ~/dotfiles'
let commits = systemlist(git .' log --oneline | head -n10')
let git = 'G'. git[1:]
return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

let g:startify_session_persistence = 1
let g:startify_session_dir = '~/dotfiles/nvim/session'
let g:startify_files_number = 5
let g:startify_bookmarks = [ {"v":"~/dotfiles/nvim"}, {"c":"~/Dropbox/code/c++/journal"} ]
let g:startify_commands = [
    \ {'m': ['My magical function', 'call Magic()']},
    \ ]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recent Files']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

function! Magic()
    echo "Hello"
endfunction

"===> Saved settings
"\ { 'header': ['   Commits'],        'type': function('s:list_commits') },
