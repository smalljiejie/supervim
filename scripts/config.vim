set cpo&vim
scriptencoding utf-8

let g:plugex_use_log = 0
let g:plugex_use_cache = 1
if !g:is_nvim
  com UpdateRemotePlugins echo ''
en

if plugex#begin()

  " ===========================================================================
  " ui
  " ===========================================================================
  " colors
  PlugEx 'morhetz/gruvbox'
  PlugEx 'sickill/vim-monokai'
  PlugEx 'tomasr/molokai'

  PlugEx 'mhinz/vim-startify', {'on_event': 'VimEnter'}
  PlugEx 'itchyny/lightline.vim', {'on_event': 'VimEnter', 'enable': !exists('g:gui_oni')}
  PlugEx 'ryanoasis/vim-devicons', {'on_event': 'VimEnter'}
  PlugEx 'junegunn/rainbow_parentheses.vim', {'on_event': 'VimEnter'}
  PlugEx 'mhinz/vim-signify', {'on_event': 'VimEnter'}
  PlugEx 'itchyny/vim-cursorword'
  PlugEx 't9md/vim-choosewin', {'on': '<plug>(choosewin)'}

  " ===========================================================================
  " completion
  " ===========================================================================
  if g:is_nvim
    " let g:use_deoplete = 1
    let g:use_ncm_for_nvim = 1
  elseif has('lua')
    let g:use_neocomplete = 1
  else
    let g:use_ncm_for_vim8 = 1
  endif

  PlugEx 'artur-shaik/vim-javacomplete2', {'for': ['java', 'jsp']}
  PlugEx 'SirVer/ultisnips', {'on_event': ['InsertEnter', 'CursorHold']}
  PlugEx 'honza/vim-snippets', {'on_event': ['InsertEnter', 'CursorHold']}
  PlugEx 'Linfee/ultisnips-zh-doc', {'on_event': ['InsertEnter', 'CursorHold']}
  PlugEx 'Shougo/context_filetype.vim', {'on_event': 'InsertEnter'}

  " completion for viml and show function params for viml and ruby
  PlugEx 'Shougo/neco-vim', {'on_event': 'InsertEnter'}
  PlugEx 'Shougo/echodoc.vim', {'on_event': 'InsertEnter', 'after': 'echodoc#enable'}
  PlugEx 'Shougo/neco-syntax', {'on_event': 'InsertEnter'} " for syntax
  PlugEx 'roxma/ncm-rct-complete', {'on_event': 'InsertEnter',
        \ 'enable': or(get(g:, 'use_ncm_for_vim8'), get(g:, 'use_ncm_for_nvim'))} " for ruby

  " deoplete
  PlugEx 'Shougo/deoplete.nvim', {'do': 'UpdateRemotePlugins',
        \ 'on_event': 'InsertEnter', 'enable': get(g:, 'use_deoplete')}
  PlugEx 'zchee/deoplete-jedi', {'lazy': 1, 'enable': get(g:, 'use_deoplete')}
  " neocomplete
  PlugEx 'Shougo/neocomplete.vim',  {'on_event': 'InsertEnter',
        \ 'enable': get(g:, 'use_neocomplete')}
  " ncm
  PlugEx 'roxma/vim-hug-neovim-rpc', {'lazy': 1,
        \ 'enable': get(g:, 'use_ncm_for_vim8')}
  PlugEx 'roxma/nvim-completion-manager', {'on_event': 'InsertEnter',
        \ 'enable': or(get(g:, 'use_ncm_for_vim8'), get(g:, 'use_ncm_for_nvim')),
        \ 'do': 'pip3 install --user neovim jedi mistune psutil setproctitle'}

  " ===========================================================================
  " editing
  " ===========================================================================
  PlugEx 'scrooloose/nerdcommenter', {'on_event': 'VimEnter'}
  PlugEx 'jiangmiao/auto-pairs', {'on_event': 'InsertEnter', 'after': 'AutoPairsTryInit'}
  PlugEx 'tpope/vim-surround', {'on_event': 'VimEnter'}
  " expand region
  PlugEx 'terryma/vim-expand-region', {'on': ['v<Plug>(expand_region_expand)', 'v<Plug>(expand_region_shrink)']}
  " format and align
  PlugEx 'sbdchd/neoformat', {'on': 'Neoformat'}
  PlugEx 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'x<Plug>(EasyAlign)']}
  " movement
  PlugEx 'easymotion/vim-easymotion', {'on_event': 'VimEnter'}
  " multiple cursors
  PlugEx 'terryma/vim-multiple-cursors', {'on_event': 'VimEnter'}
  " see content of register
  PlugEx 'junegunn/vim-peekaboo', {'on_event': 'VimEnter'}

  PlugEx 'tpope/tpope-vim-abolish', {'on_event': 'VimEnter'}

  " textobj
  PlugEx 'kana/vim-textobj-user', {'lazy': 1}
  PlugEx 'kana/vim-textobj-indent', {'on_event': 'VimEnter'}
  PlugEx 'kana/vim-textobj-line', {'on_event': 'VimEnter'}
  PlugEx 'kana/vim-textobj-entire', {'on_event': 'VimEnter'}
  PlugEx 'kana/vim-textobj-syntax', {'on_event': 'VimEnter'}
  PlugEx 'kana/vim-textobj-lastpat', {'on_event': 'VimEnter'}

  " ===========================================================================
  " lang
  " ===========================================================================
  " front end
  PlugEx 'Valloric/MatchTagAlways', {'for': ['html', 'xml', 'xhtml', 'jsp']}
  PlugEx 'pangloss/vim-javascript', {'for': 'javascript'}
  PlugEx 'elzr/vim-json',           {'for': 'json'}
  PlugEx 'hail2u/vim-css3-syntax',  {'for': 'css'}
  PlugEx 'othree/html5.vim',        {'for': 'html'}

  " markdown
  PlugEx 'godlygeek/tabular', {'on': ['Tabularize', 'AddTabularPattern', 'AddTabularPipeline']}
  PlugEx 'plasticboy/vim-markdown' " no plugin dir, no need to lazyload
  PlugEx 'iamcco/markdown-preview.vim', {'on': 'MarkdownPreview'}
  PlugEx 'mzlogin/vim-markdown-toc', {'on_event': 'VimEnter if &ft==''markdown'''}

  " javascript
  PlugEx 'othree/javascript-libraries-syntax.vim' " no plugin dir, no need to lazyload

  " python
  PlugEx 'davidhalter/jedi-vim', {'on_event': 'InsertEnter if &ft==''python'''}

  " ruby
  PlugEx 'vim-ruby/vim-ruby' " no plugin dir, no need to lazyload

  " kotlin
  PlugEx 'udalov/kotlin-vim' " no plugin dir, no need to lazyload

  " scala
  PlugEx 'derekwyatt/vim-scala', {'for': 'scala'}

  " vimwiki
  PlugEx 'vimwiki/vimwiki', {'for': 'wiki', 'on': 'VimwikiTabIndex'}

  " xml
  PlugEx 'sukima/xmledit' " no plugin dir, no need to lazyload

  " viml dev
  " go to define
  PlugEx 'mhinz/vim-lookup', {'on_func': ['lookup#lookup', 'lookup#pop']}
  " plugin for making plugin
  PlugEx 'tpope/vim-scriptease', {'on_func': 'scriptease#helptopic'}
  " get the version of Vim and Neovim that introduced or removed features
  PlugEx 'tweekmonster/helpful.vim', {'on': 'HelpfulVersion', 'for': 'help'}
  " for test
  PlugEx 'junegunn/vader.vim', {'on': 'Vader'}

  " ===========================================================================
  " tools
  " ===========================================================================
  " nerdtree
  PlugEx 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeTabsToggle']}
  PlugEx 'jistr/vim-nerdtree-tabs', {'lazy': 1}
  PlugEx 'Xuyuanp/nerdtree-git-plugin', {'lazy': 1}
  PlugEx 'Linfee/nerdtree-open', {'lazy': 1}

  " undotree
  PlugEx 'mbbill/undotree',    {'on': 'UndotreeToggle'}

  " syntastic
  PlugEx 'vim-syntastic/syntastic', {'on_event': 'InsertEnter'}

  PlugEx 'Konfekt/FastFold',   {'on_event': 'VimEnter'}
  PlugEx 'tpope/vim-repeat' " no plugin dir, no need to lazyload

  " git
  PlugEx 'tpope/vim-fugitive', {'on_event': 'VimEnter'}
  PlugEx 'gregsexton/gitv',    {'on': 'Gitv'}
  PlugEx 'junegunn/gv.vim',    {'on': 'GV'}
  PlugEx 'cohama/agit.vim',    {'on': ['Agit', 'AgitFile']}
  PlugEx 'lambdalisue/gina.vim', {'on': 'Gina'}

  " search
  PlugEx 'osyo-manga/vim-over', {'on': 'OverCommandLine'}
  PlugEx 'dyng/ctrlsf.vim', {'on': ['CtrlSF', 'CtrlSFOpen', 'CtrlSFUpdate',
        \ 'CtrlSFClose', 'CtrlSFClearHL', 'CtrlSFToggle', 'CtrlSFQuickfix',
        \ '<Plug>CtrlSFPrompt', '<Plug>CtrlSFVwordPath', '<Plug>CtrlSFVwordExec',
        \ '<Plug>CtrlSFCwordPath', '<Plug>CtrlSFPwordPath']}
  PlugEx 'mhinz/vim-grepper', {'on': ['Grepper', 'GrepperAg', 'GrepperGit',
        \ 'GrepperGrep', '<plug>(GrepperOperator)']}
  " incsearch
  PlugEx 'haya14busa/incsearch.vim', {'on': ['<Plug>(incsearch-forward)',
        \ '<Plug>(incsearch-backward)', '<Plug>(incsearch-stay)']}
  PlugEx 'haya14busa/incsearch-fuzzy.vim', {'deps': 'incsearch.vim',
        \ 'on': ['<Plug>(incsearch-fuzzy-/)', '<Plug>(incsearch-fuzzy-?)',
        \ '<Plug>(incsearch-fuzzy-stay)']}
  PlugEx 'haya14busa/vim-asterisk', {'deps': 'incsearch.vim', 'on': [
        \ '<Plug>(asterisk-*)', '<Plug>(asterisk-#)', '<Plug>(asterisk-g*)',
        \ '<Plug>(asterisk-g#)', '<Plug>(asterisk-z*)', '<Plug>(asterisk-gz*)',
        \ '<Plug>(asterisk-z#)', '<Plug>(asterisk-gz#)']} " *-Improved
  PlugEx 'haya14busa/incsearch-easymotion.vim', {'deps':
        \ ['incsearch.vim', 'vim-easymotion'],
        \ 'on': ['<Plug>(incsearch-easymotion-/)',
        \ '<Plug>(incsearch-easymotion-?)', '<Plug>(incsearch-easymotion-stay)']}

  " denite
  let g:use_denite = (g:is_nvim || v:version>=800) && has('python3')
  PlugEx 'Shougo/denite.nvim', {'do': 'UpdateRemotePlugins',
        \ 'enable': g:use_denite, 'on': 'Denite', 'on_event': 'CursorHold'}
  PlugEx 'Shougo/neomru.vim',  {'on': ['NeoMRUReload', 'NeoMRUSave',
        \ 'NeoMRUImportFile', 'NeoMRUImportDirectory']}

  " help focus on writing in vim
  PlugEx 'junegunn/goyo.vim',  {'on': 'Goyo'}
  PlugEx 'junegunn/limelight.vim', {'on': 'Limelight'}

  PlugEx 'majutsushi/tagbar', {'on': ['TagbarToggle', 'TagbarOpen', 'Tagbar'],
        \ 'enable': executable('ctags')}
  " vim calendar
  PlugEx 'itchyny/calendar.vim', {'on': 'Calendar'}
  " close anything
  PlugEx 'mhinz/vim-sayonara', {'on': 'Sayonara'}
  " the interactive scratchpad for hackers
  PlugEx 'metakirby5/codi.vim', {'on': 'Codi'}
  "  tracing exceptions thrown by VimL scripts
  PlugEx 'tweekmonster/exception.vim' " no plugin dir, no need to lazyload

  " ===========================================================================
  " other
  " ===========================================================================
  PlugEx 'strom3xFeI/vimdoc-cn', {'lazy': 1}

  PlugEx '~/tmp/vim/vim-finder'
endif
call plugex#end()

" theme setting
call config#theme#after()

" =============================================================================
" triggers
" =============================================================================
" for vim-surround
vmap Si S(i_<esc>f)

" for vim-over
" <leader>rr快速执行替换预览
nnoremap <leader>rr :OverCommandLine<cr>%s/

" for vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
let g:expand_region_text_objects = {
      \ 'iw': 0, 'iW': 0, 'i"': 0, 'i''': 0, 'i]': 1, 'ib': 1,
      \ 'iB': 1, 'il':1 , 'ii':1 , 'ip' : 0, 'ie': 0 }

" for vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)
nnoremap <leader>ga ga

" for vim-multiple-cursors
nnoremap <silent> <c-c> :call multiple_cursors#quit()<CR>
nnoremap <silent> <space>/ :MultipleCursorsFind <c-r>/<cr>
vnoremap <silent> <space>/ :MultipleCursorsFind <c-r>/<cr>

" for vimwiki
nnoremap <leader>v :VimwikiTabIndex<cr>

" for nerdtree
nnoremap <leader>n :NERDTreeTabsToggle<cr>
nnoremap <leader>e :NERDTreeFind<CR>

" for Goyo
nnoremap <leader>tg :Goyo<cr>

" for tagbar
if executable('ctags')
  nnoremap <leader>tt :TagbarToggle<cr>
endif

" for undotree
nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle=1

" for vim-sayonara(
nnoremap <tab>q :Sayonara<cr>

" for calendar
nnoremap <space>c :Calendar -view=year -split=horizontal -position=below -height=12<cr>

" for rainbow_parentheses.vim
nnoremap <leader>tr :RainbowParentheses!!<cr>

" for exception.vim
com! -bar WTF call exception#trace()

" for vim-scriptease
nnoremap <silent> K :<C-U>exe 'help '.scriptease#helptopic()<CR>

" for nerdcommenter
Map n <a-/> <Plug>NERDCommenterToggle
Map v <a-/> <Plug>NERDCommenterToggle

" for ctrlsf.vim
nnoremap <space>s :set operatorfunc=config#ctrlsf_vim#ctrlsf_search<cr>g@
vnoremap <space>s :<c-u>call config#ctrlsf_vim#ctrlsf_search(visualmode())<cr>
nmap     <c-s>f <Plug>CtrlSFPrompt
vmap     <c-s>f <Plug>CtrlSFVwordPath
vmap     <c-s>F <Plug>CtrlSFVwordExec
nmap     <c-s>n <Plug>CtrlSFCwordPath
nmap     <c-s>p <Plug>CtrlSFPwordPath
nnoremap <c-s>o :CtrlSFOpen<CR>
nnoremap <c-s>t :CtrlSFToggle<CR>
inoremap <c-s>t <Esc>:CtrlSFToggle<CR>


" completion
" omni 补全配置
augroup omnif
  autocmd!
  autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  " python使用jedi
  autocmd FileType python setlocal omnifunc=jedi#completions
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END


" for Gina
nnoremap <silent> <space>gd :Gina diff<CR>
nnoremap <silent> <space>gs :Gina status<CR>
nnoremap <silent> <space>gc :Gina commit<CR>
nnoremap <silent> <space>gb :Gina blame :<CR>
nnoremap <silent> <space>gp :Gina push<CR>
nnoremap <silent> <space>ga :Gina add %<CR>
nnoremap <silent> <space>gA :Gina add .<CR>

" for incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" incsearch-fuzzy.vim
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
" vim-asterisk
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
" for incsearch-easymotion.vim
map <leader>/ <Plug>(incsearch-easymotion-/)
map <leader>? <Plug>(incsearch-easymotion-?)
map <leader>g/ <Plug>(incsearch-easymotion-stay)
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
        \   'converters': [incsearch#config#fuzzy#converter()],
        \   'modules': [incsearch#config#easymotion#module()],
        \   'keymap': {"\<CR>": '<Over>(easymotion)'},
        \   'is_expr': 0,
        \   'is_stay': 1
        \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <leader>/ incsearch#go(<SID>config_easyfuzzymotion())

" vim-choosewin
nmap <tab><tab> <plug>(choosewin)

" vim-grepper
nnoremap <leader>ff :Grepper

" for denitep
" mapping
nnoremap <space>o :Denite file_rec<cr>
