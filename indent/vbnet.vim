" Vim indent file
" Language   : VisualBasic.NET
" Maintainers: OGURA Daiki
" Last Change: 2013-01-25

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal expandtab
setlocal tabstop<
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal indentexpr=VbNetGetIndent(v:lnum)
setlocal indentkeys=!^F,o,O,0#,0=~end\ ,0=~catch,0=~else,0=~next,<:>

" Only define the function once.
if exists("*VbNetGetIndent")
  finish
endif
let s:keepcpo= &cpo
set cpo&vim

function VbNetGetIndent(lnum)
  " labels and preprocessor get zero indent immediately
  let this_line = getline(a:lnum)
  let LABELS_OR_PREPROC = '^\s*\(\<\k\+\>:\s*$\|#.*\)'
  if this_line =~? LABELS_OR_PREPROC
    return 0
  endif

  let previous_line = ''
  let ind = 0

  " Find a non-blank line above the current line.
  " Skip over labels and preprocessor directives.
  let lnum = a:lnum
  while lnum > 0
    let lnum = prevnonblank(lnum - 1)
    let previous_line = getline(lnum)
    let ind = indent(lnum)
    if previous_line !~? LABELS_OR_PREPROC
      break
    endif
  endwhile

  let access_modifier = '\(\<\(Public\|Protected\|Private\|Friend\)\>\s\+\)\?'
  let method_modifier = '\(\<\(Overrides\|Overridable\|Overloads\|NotOverridable\|MustOverride\|Shadows\|Shared\|ReadOnly\|WriteOnly\)\>\s\+\)\?'
  let modifier = access_modifier . method_modifier

  let close_end_statement = '\<\(If\|With\|Select\|Try\|Using\|Sub\|Function\|Property\|Get\|Set\|Class\|Module\|Interface\|Namespace\|Structure\|Enum\|Operator\)\>'


  if this_line =~? '^\s*End\s\+' . close_end_statement
    let st = matchstr(this_line, close_end_statement)
    if previous_line =~? st
      return ind
    else
      if st ==? 'Select'
        let ind -= &l:shiftwidth
        if this_line =~? 'Select' && previous_line !~? '\s\+Case\s\+'
          let ind -= &l:shiftwidth
        endif
      elseif st ==? 'Try'
        if previous_line !~? '\s*\<\(Catch\|Finally\)\>'
          let ind -= &l:shiftwidth
        endif
      elseif st ==? 'If'
        if previous_line !~? '^\s*\<Else\>\|\<Then\>\s*$'
          let ind -= &l:shiftwidth
        endif
      elseif st ==? 'Property'
        let ind -= &l:shiftwidth
        if previous_line !~? '\s\+\<\(Get\|Set\)\>'
          let ind -= &l:shiftwidth
        endif
      else
        let ind -= &l:shiftwidth
      endif
      return ind
    endif
  elseif this_line =~? '\s*\(\<Else\(If\)\?\>\)'
    if previous_line !~? '\<Then\>\s*$'
      let ind -= &l:shiftwidth
    endif
    return ind
  elseif this_line =~? '\s*\(\<Catch\>\)'
    if previous_line !~? '\s*\<Try\>\s*$'
      let ind -= &l:shiftwidth
    endif
    return ind
  elseif this_line =~? '\s*\(\<Finally\>\)'
    if previous_line !~? '\s*\<Try\>\s*$\|\s*\<Catch\>'
      let ind -= &l:shiftwidth
    endif
    return ind
  elseif this_line =~? '\s*\(\<Next\>\)'
    return ind - &l:shiftwidth
  elseif this_line =~? '\s*\(\<Get\>\|\<Set\>\s\*(\)'
  endif

  if previous_line =~ '\s_$' || previous_line =~ ',$' || previous_line =~ '^\s*\.'
    return ind
  elseif previous_line =~ '{$' || previous_line =~ '($' || previous_line =~ '=$'
    return ind + &l:shiftwidth
  elseif previous_line =~? '^Namespace'
    return ind + &l:shiftwidth
  elseif previous_line =~? '^\s*' . modifier . '\<\(Class\|Module\|Enum\|Interface\|Operator\|Sub\|Function\)\>'
    return ind + &l:shiftwidth
  elseif previous_line =~? '^\s*' . modifier . '\<\(Property\)\>'
    if this_line =~? '^\s*\(\<Get\>\|\<Set\>\)'
      return ind + &l:shiftwidth
    endif
  endif

  if previous_line =~? 'Then$'
    return ind + &l:shiftwidth
  elseif previous_line =~? '^\s*\<\(Select Case\|Else\|ElseIf\|For\|While\|Using\|With\|Try\|Catch\|Finally\)\>'
    return ind + &l:shiftwidth
  elseif previous_line =~? '^\s*\<\(Get\|Set\)\>'
    return ind + &l:shiftwidth
  elseif previous_line =~? '^\s\+}$'
    return &l:shiftwidth + &l:shiftwidth
  endif

  return ind
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo

let b:undo_indent = 'setlocal '.join([
\   'autoindent<',
\   'expandtab<',
\   'indentexpr<',
\   'indentkeys<',
\   'shiftwidth<',
\   'softtabstop<',
\ ])

" vim:sw=2
