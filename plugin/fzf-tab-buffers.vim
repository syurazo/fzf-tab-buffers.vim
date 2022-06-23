if exists('g:loaded_fzf_tab_buffers_vim')
  finish
endif
let g:loaded_fzf_tab_buffers_vim = 1

command! -bar -bang -nargs=0 TabBuffers call fzf_tab_buffers#tab_buffers(<bang>0)
