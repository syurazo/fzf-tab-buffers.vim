let g:fzf_tab_buffers_action = get(g:, 'fzf_tab_buffers_action', 'buffer')

let s:default_actions = {
\   'ctrl-t': 'tab split',
\   'ctrl-x': 'split',
\   'ctrl-v': 'vsplit',
\ }

function! fzf_tab_buffers#tab_buffers(bang)
  let actions = get(g:, 'fzf_action', s:default_actions)
  let actions = get(g:, 'fzf_tab_buffers_actions', actions)
  let expects = '--expect='.join(keys(actions), ',')

  function! s:sink(actions, lines)
    let bn = matchstr(a:lines[1], '\[\zs[0-9]*\ze\]')
    let default_cmd = get(g:, 'fzf_tab_buffers_action', 'buffer')
    let cmd = get(a:actions, a:lines[0], default_cmd)
    execute cmd . bn
  endfunction

  let buffers = filter(map(keys(t:tabpagebuffer), '0+v:val'), 'buflisted(v:val) && getbufvar(v:val, "&filetype") != "qf"')
  return fzf#run(fzf#wrap('tab-buffers', {
  \ 'source':  map(buffers, 'fzf#vim#_format_buffer(v:val)'),
  \ 'sink*':   function('s:sink', [actions]),
  \ 'options': [expects, '+m', '-x', '--tiebreak=index', '--ansi', '-d', '\t', '--with-nth', '3..', '-n', '2', '--prompt', 'Buffer> ', '--preview-window', '+{2}-/2' ]
  \}, a:bang))
endfunction
