if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

let s:keepcpo = &cpo
set cpo&vim

setlocal cinkeys-=0#
setlocal indentkeys-=0#
setlocal suffixesadd=.vb
setlocal comments-=:%
setlocal commentstring='%s

function! s:VbSearch(pattern, flags)
    let cnt = v:count1
    while cnt > 0
      call search(a:pattern, a:flags)
      let cnt = cnt - 1
    endwhile
endfun

nnoremap <buffer> <silent> [[ :<C-u>call <SID>VbSearch('^\s*\<\(private\<Bar>public\<Bar>friend\<Bar>protected\)\>\s\+\(function\<Bar>sub\)', 'bW')<cr>
nnoremap <buffer> <silent> ]] :<C-u>call <SID>VbSearch('^\s*\<\(private\<Bar>public\<Bar>friend\<Bar>protected\)\>\s\+\(function\<Bar>sub\)', 'W')<cr>
nnoremap <buffer> <silent> [] :call <SID>VbSearch('^\s*\<end\>\s\+\(function\\|sub\)', 'bW')<cr>
nnoremap <buffer> <silent> ][ :call <SID>VbSearch('^\s*\<end\>\s\+\(function\\|sub\)', 'W')<cr>

inoreabbr <silent> <buffer> if <C-R>=VBNetIab_ReplaceConditionally('if', 'If')<CR>
inoreabbr <silent> <buffer> then <C-R>=VBNetIab_ReplaceConditionally('then', 'Then')<CR>
inoreabbr <silent> <buffer> elseif <C-R>=VBNetIab_ReplaceConditionally('elseif', 'ElseIf')<CR>
inoreabbr <silent> <buffer> else <C-R>=VBNetIab_ReplaceConditionally('else', 'Else')<CR>
inoreabbr <silent> <buffer> end <C-R>=VBNetIab_ReplaceConditionally('end', 'End')<CR>
inoreabbr <silent> <buffer> dim <C-R>=VBNetIab_ReplaceConditionally('dim', 'Dim')<CR>
inoreabbr <silent> <buffer> redim <C-R>=VBNetIab_ReplaceConditionally('redim', 'ReDim')<CR>
inoreabbr <silent> <buffer> as <C-R>=VBNetIab_ReplaceConditionally('as', 'As')<CR>
inoreabbr <silent> <buffer> boolean <C-R>=VBNetIab_ReplaceConditionally('boolean', 'Boolean')<CR>
inoreabbr <silent> <buffer> integer <C-R>=VBNetIab_ReplaceConditionally('integer', 'Integer')<CR>
inoreabbr <silent> <buffer> string <C-R>=VBNetIab_ReplaceConditionally('string', 'String')<CR>
inoreabbr <silent> <buffer> date <C-R>=VBNetIab_ReplaceConditionally('date', 'Date')<CR>
inoreabbr <silent> <buffer> long <C-R>=VBNetIab_ReplaceConditionally('long', 'Long')<CR>
inoreabbr <silent> <buffer> with <C-R>=VBNetIab_ReplaceConditionally('with', 'With')<CR>
inoreabbr <silent> <buffer> select <C-R>=VBNetIab_ReplaceConditionally('select', 'Select')<CR>
inoreabbr <silent> <buffer> case <C-R>=VBNetIab_ReplaceConditionally('case', 'Case')<CR>
inoreabbr <silent> <buffer> true <C-R>=VBNetIab_ReplaceConditionally('true', 'True')<CR>
inoreabbr <silent> <buffer> false <C-R>=VBNetIab_ReplaceConditionally('false', 'False')<CR>
inoreabbr <silent> <buffer> new <C-R>=VBNetIab_ReplaceConditionally('new', 'New')<CR>
inoreabbr <silent> <buffer> me <C-R>=VBNetIab_ReplaceConditionally('me', 'Me')<CR>
inoreabbr <silent> <buffer> for <C-R>=VBNetIab_ReplaceConditionally('for', 'For')<CR>
inoreabbr <silent> <buffer> each <C-R>=VBNetIab_ReplaceConditionally('each', 'Each')<CR>
inoreabbr <silent> <buffer> step <C-R>=VBNetIab_ReplaceConditionally('step', 'Step')<CR>
inoreabbr <silent> <buffer> continue <C-R>=VBNetIab_ReplaceConditionally('continue', 'Continue')<CR>
inoreabbr <silent> <buffer> next <C-R>=VBNetIab_ReplaceConditionally('next', 'Next')<CR>
inoreabbr <silent> <buffer> while <C-R>=VBNetIab_ReplaceConditionally('while', 'While')<CR>
inoreabbr <silent> <buffer> not <C-R>=VBNetIab_ReplaceConditionally('not', 'Not')<CR>
inoreabbr <silent> <buffer> try <C-R>=VBNetIab_ReplaceConditionally('try', 'Try')<CR>
inoreabbr <silent> <buffer> catch <C-R>=VBNetIab_ReplaceConditionally('catch', 'Catch')<CR>
inoreabbr <silent> <buffer> finally <C-R>=VBNetIab_ReplaceConditionally('finally', 'Finally')<CR>
inoreabbr <silent> <buffer> throw <C-R>=VBNetIab_ReplaceConditionally('throw', 'Throw')<CR>
inoreabbr <silent> <buffer> region <C-R>=VBNetIab_ReplaceConditionally('region', 'Region')<CR>
inoreabbr <silent> <buffer> function <C-R>=VBNetIab_ReplaceConditionally('function', 'Function')<CR>
inoreabbr <silent> <buffer> sub <C-R>=VBNetIab_ReplaceConditionally('sub', 'Sub')<CR>
inoreabbr <silent> <buffer> private <C-R>=VBNetIab_ReplaceConditionally('private', 'Private')<CR>
inoreabbr <silent> <buffer> public <C-R>=VBNetIab_ReplaceConditionally('public', 'Public')<CR>
inoreabbr <silent> <buffer> protected <C-R>=VBNetIab_ReplaceConditionally('protected', 'Protected')<CR>
inoreabbr <silent> <buffer> ctype <C-R>=VBNetIab_ReplaceConditionally('ctype', 'CType')<CR>
inoreabbr <silent> <buffer> decimal <C-R>=VBNetIab_ReplaceConditionally('decimal', 'Decimal')<CR>
inoreabbr <silent> <buffer> object <C-R>=VBNetIab_ReplaceConditionally('object', 'Object')<CR>
inoreabbr <silent> <buffer> byval <C-R>=VBNetIab_ReplaceConditionally('byval', 'ByVal')<CR>
inoreabbr <silent> <buffer> byref <C-R>=VBNetIab_ReplaceConditionally('byref', 'ByRef')<CR>
inoreabbr <silent> <buffer> handles <C-R>=VBNetIab_ReplaceConditionally('handles', 'Handles')<CR>
inoreabbr <silent> <buffer> class <C-R>=VBNetIab_ReplaceConditionally('class', 'Class')<CR>
inoreabbr <silent> <buffer> module <C-R>=VBNetIab_ReplaceConditionally('module', 'Module')<CR>
inoreabbr <silent> <buffer> in <C-R>=VBNetIab_ReplaceConditionally('in', 'In')<CR>
inoreabbr <silent> <buffer> on <C-R>=VBNetIab_ReplaceConditionally('on', 'On')<CR>
inoreabbr <silent> <buffer> option <C-R>=VBNetIab_ReplaceConditionally('option', 'Option')<CR>
inoreabbr <silent> <buffer> strict <C-R>=VBNetIab_ReplaceConditionally('strict', 'Strict')<CR>
inoreabbr <silent> <buffer> delegate <C-R>=VBNetIab_ReplaceConditionally('delegate', 'Delegate')<CR>
inoreabbr <silent> <buffer> interface <C-R>=VBNetIab_ReplaceConditionally('interface', 'Interface')<CR>
inoreabbr <silent> <buffer> implements <C-R>=VBNetIab_ReplaceConditionally('implements', 'Implements')<CR>
inoreabbr <silent> <buffer> inherits <C-R>=VBNetIab_ReplaceConditionally('inherits', 'Inherits')<CR>
inoreabbr <silent> <buffer> mustinherit <C-R>=VBNetIab_ReplaceConditionally('mustinherit', 'MustInherit')<CR>
inoreabbr <silent> <buffer> notinheritable <C-R>=VBNetIab_ReplaceConditionally('notinheritable', 'NotInheritable')<CR>
inoreabbr <silent> <buffer> overloads <C-R>=VBNetIab_ReplaceConditionally('overloads', 'Overloads')<CR>
inoreabbr <silent> <buffer> overrides <C-R>=VBNetIab_ReplaceConditionally('overrides', 'Overrides')<CR>
inoreabbr <silent> <buffer> overridable <C-R>=VBNetIab_ReplaceConditionally('overridable', 'Overridable')<CR>
inoreabbr <silent> <buffer> notoverridable <C-R>=VBNetIab_ReplaceConditionally('notoverridable', 'NotOverridable')<CR>
inoreabbr <silent> <buffer> mustoverride <C-R>=VBNetIab_ReplaceConditionally('mustoverride', 'MustOverride')<CR>
inoreabbr <silent> <buffer> shadows <C-R>=VBNetIab_ReplaceConditionally('shadows', 'Shadows')<CR>
inoreabbr <silent> <buffer> is <C-R>=VBNetIab_ReplaceConditionally('is', 'Is')<CR>
inoreabbr <silent> <buffer> isnot <C-R>=VBNetIab_ReplaceConditionally('isnot', 'IsNot')<CR>
inoreabbr <silent> <buffer> and <C-R>=VBNetIab_ReplaceConditionally('and', 'And')<CR>
inoreabbr <silent> <buffer> andalso <C-R>=VBNetIab_ReplaceConditionally('andalso', 'AndAlso')<CR>
inoreabbr <silent> <buffer> or <C-R>=VBNetIab_ReplaceConditionally('or', 'Or')<CR>
inoreabbr <silent> <buffer> orelse <C-R>=VBNetIab_ReplaceConditionally('orelse', 'OrElse')<CR>
inoreabbr <silent> <buffer> nothing <C-R>=VBNetIab_ReplaceConditionally('nothing', 'Nothing')<CR>
inoreabbr <silent> <buffer> enum <C-R>=VBNetIab_ReplaceConditionally('enum', 'Enum')<CR>
inoreabbr <silent> <buffer> const <C-R>=VBNetIab_ReplaceConditionally('const', 'Const')<CR>
inoreabbr <silent> <buffer> imports <C-R>=VBNetIab_ReplaceConditionally('imports', 'Imports')<CR>
inoreabbr <silent> <buffer> readonly <C-R>=VBNetIab_ReplaceConditionally('readonly', 'ReadOnly')<CR>
inoreabbr <silent> <buffer> writeonly <C-R>=VBNetIab_ReplaceConditionally('writeonly', 'WriteOnly')<CR>
inoreabbr <silent> <buffer> event <C-R>=VBNetIab_ReplaceConditionally('event', 'Event')<CR>
inoreabbr <silent> <buffer> structure <C-R>=VBNetIab_ReplaceConditionally('structure', 'Structure')<CR>
inoreabbr <silent> <buffer> shared <C-R>=VBNetIab_ReplaceConditionally('shared', 'Shared')<CR>
inoreabbr <silent> <buffer> property <C-R>=VBNetIab_ReplaceConditionally('property', 'Property')<CR>
inoreabbr <silent> <buffer> get <C-R>=VBNetIab_ReplaceConditionally('get', 'Get')<CR>
inoreabbr <silent> <buffer> set <C-R>=VBNetIab_ReplaceConditionally('set', 'Set')<CR>
inoreabbr <silent> <buffer> return <C-R>=VBNetIab_ReplaceConditionally('return', 'Return')<CR>
inoreabbr <silent> <buffer> optional <C-R>=VBNetIab_ReplaceConditionally('optional', 'Optional')<CR>
inoreabbr <silent> <buffer> raiseevent <C-R>=VBNetIab_ReplaceConditionally('raiseevent', 'RaiseEvent')<CR>
inoreabbr <silent> <buffer> of <C-R>=VBNetIab_ReplaceConditionally('of', 'Of')<CR>
inoreabbr <silent> <buffer> do <C-R>=VBNetIab_ReplaceConditionally('do', 'Do')<CR>
inoreabbr <silent> <buffer> until <C-R>=VBNetIab_ReplaceConditionally('until', 'Until')<CR>
inoreabbr <silent> <buffer> loop <C-R>=VBNetIab_ReplaceConditionally('loop', 'Loop')<CR>
inoreabbr <silent> <buffer> goto <C-R>=VBNetIab_ReplaceConditionally('goto', 'Goto')<CR>
inoreabbr <silent> <buffer> like <C-R>=VBNetIab_ReplaceConditionally('like', 'Like')<CR>
inoreabbr <silent> <buffer> exit <C-R>=VBNetIab_ReplaceConditionally('exit', 'Exit')<CR>
inoreabbr <silent> <buffer> friend <C-R>=VBNetIab_ReplaceConditionally('friend', 'Friend')<CR>
inoreabbr <silent> <buffer> iif <C-R>=VBNetIab_ReplaceConditionally('iif', 'IIf')<CR>

if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_words = '\<Namespace\>:\<End Namespace\>'
          \ . ',\<Module\>:\<End Module\>'
          \ . ',\<Class\>:\<End Class\>'
          \ . ',\<Interface\>:\<End Interface\>'
          \ . ',\<Property\>:\<End Property\>'
          \ . ',\<Enum\>:\<End Enum\>'
          \ . ',\<Function\>:\<End Function\>'
          \ . ',\<Sub\>:\<End Sub\>'
          \ . ',\<Get\>:\<End Get\>'
          \ . ',\<Set\>:\<End Set\>'
          \ . ',\<For\>:\<Next\>'
          \ . ',\<While\>:\<End While\>'
          \ . ',\<Select\>:\<End Select\>'
          \ . ',\<Using\>:\<End Using\>'
          \ . ',\<With\>:\<End With\>'
          \ . ',\<Try\>:\<End Try\>'
          \ . ',\<If\>:\<End If\>'
endif

function! VBNetIab_ReplaceConditionally(original, replacement)
  " only replace outside of comments or strings (which map to constant)
  let elesyn = synIDtrans(synID(line("."), col(".") - 1, 0))
  if elesyn != hlID('Comment') && elesyn != hlID('Constant')
    let word = a:replacement
  else
    let word = a:original
  endif

  let b:UndoBuffer = a:original
  return word
endfunction

inoremap <buffer> <C-X>u <C-W><C-R>=b:UndoBuffer<CR><C-V><Space>

let &cpo = s:keepcpo

unlet s:keepcpo
