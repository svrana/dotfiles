if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal autoindent
setlocal formatoptions=tcq2l
setlocal textwidth=78 shiftwidth=2
setlocal softtabstop=2 tabstop=8
setlocal expandtab

" vim: sw=2 sts=2 et
