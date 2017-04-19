
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf8,chinese,latin1,gbk,big5,ucs-bom
if has('win32') || has('win64')()
  if !has('gui_running')
    " set fileencoding=chinese
    set termencoding=utf8
    " 解决console输出乱码
    " language messages zh_CN.utf-8
    language messages zh_CN.utf8
  el
    "set fileencodings=utf-8,chinese,latin-1
    "set fileencoding=chinese
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    " 解决console输出乱码
    set langmenu=none
    language messages zh_CN.utf8
  en
en