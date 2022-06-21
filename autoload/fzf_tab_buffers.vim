function! s:open_buffer(lines)
  execute 'buffer' matchstr(a:lines[0], '\[\zs[0-9]*\ze\]')
endfunction

function! fzf_tab_buffers#tab_buffers(bang)
  let buffers = filter(map(keys(t:tabpagebuffer), '0+v:val'), 'buflisted(v:val) && getbufvar(v:val, "&filetype") != "qf"')
  return fzf#run(fzf#wrap('tab-buffers', {
  \ 'source':  map(buffers, 'fzf#vim#_format_buffer(v:val)'),
  \ 'sink*':   function('s:open_buffer'),
  \ 'options': ['+m', '-x', '--tiebreak=index', '--ansi', '-d', '\t', '--with-nth', '3..', '-n', '2', '--prompt', 'Buffer> ', '--preview-window', '+{2}-/2' ]
  \}, a:bang))
endfunction
