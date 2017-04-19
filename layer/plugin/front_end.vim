" Layer: front_end

" hilight html tag
LayerPlugin 'Valloric/MatchTagAlways', {'for': ['html', 'xml']}
LayerPlugin 'pangloss/vim-javascript', {'for': 'javascript'}
LayerPlugin 'elzr/vim-json', {'for': 'json'}
" css3 syntax support
LayerPlugin 'hail2u/vim-css3-syntax', {'for': 'css'}


fu! front_end#after()
  " for MatchTagAlways
  let g:mta_use_matchparen_group = 1
  let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \}

  " for vim-javascript
  let g:javascript_plugin_jsdoc = 1
  let g:javascript_plugin_ngdoc = 1
  let g:javascript_plugin_flow = 1
  " set foldmethod=syntax
  let g:javascript_conceal_function       = "ƒ"
  let g:javascript_conceal_null           = "ø"
  let g:javascript_conceal_this           = "@"
  " let g:javascript_conceal_return         = "⇚"
  let g:javascript_conceal_undefined      = "¿"
  " let g:javascript_conceal_NaN            = "ℕ"
  let g:javascript_conceal_prototype      = "¶"
  " let g:javascript_conceal_static         = "•"
  let g:javascript_conceal_super          = "Ω"
  " let g:javascript_conceal_arrow_function = "⇒"

  " for vim-json
  nnoremap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
  let g:vim_json_syntax_conceal = 0
endf
