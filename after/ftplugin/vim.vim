" filetype config for .vim file

setl smarttab
setl expandtab
setl autoindent
setl shiftwidth=2
setl tabstop=2
setl softtabstop=2
setl textwidth=80
setl fmr={{,}}
setl fdm=marker
setl nospell


setl nowrap

" 执行默认缓冲区内容
" nnoremap <buffer> <space>e :@*<cr>

nnoremap <buffer><silent> <cr>  :call lookup#lookup()<cr>
nnoremap <buffer><silent> <bs>  :call lookup#pop()<cr>
