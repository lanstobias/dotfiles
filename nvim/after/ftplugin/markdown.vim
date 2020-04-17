" ============================== Functions ===================================
function! s:NotCodeBlock(lnum) abort
  return synIDattr(synID(v:lnum, 1, 1), 'name') !=# 'markdownCode'
endfunction

function! MarkdownFold() abort
  let line = getline(v:lnum)

  if line =~# '^#\+ ' && s:NotCodeBlock(v:lnum)
    return ">" . match(line, ' ')
  endif

  let nextline = getline(v:lnum + 1)
  if (line =~ '^.\+$') && (nextline =~ '^=\+$') && s:NotCodeBlock(v:lnum + 1)
    return ">1"
  endif

  if (line =~ '^.\+$') && (nextline =~ '^-\+$') && s:NotCodeBlock(v:lnum + 1)
    return ">2"
  endif

  return "="
endfunction


" =============================== Settings ===================================
setlocal wrap
setlocal textwidth=80
setlocal formatoptions+=t
setlocal comments=fb:*,fb:-,fb:+,n:> commentstring=<!--%s-->
setlocal formatoptions+=tcqln formatoptions-=r formatoptions-=o
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:

if has("folding") && exists("g:markdown_folding")
  setlocal foldexpr=MarkdownFold()
  setlocal foldmethod=expr
  setlocal foldtext=MarkdownFoldText()
  let b:undo_ftplugin .= " foldexpr< foldmethod< foldtext<"
endif
