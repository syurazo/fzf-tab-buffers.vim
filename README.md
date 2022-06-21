# fzf-tab-buffers.vim

Provide `TabBuffers` command to select buffers displayed in tabs in fzf.vim.

## Installation

Here is the example of using [vim-plug](https://github.com/junegunn/vim-plug).

```
Plug 'syurazo/fzf-tab-buffers.vim'
```

fzf-tab-buffers.vim depends on [tabpagebuffer.vim](https://github.com/Shougo/tabpagebuffer.vim) for buffer enumeration

## Usage

```
nnoremap [fzf] <Nop>
nmap <Leader>f [fzf]

nnoremap <silent> [fzf]b :<C-u>TabBuffers<CR>
```

## License

MIT
