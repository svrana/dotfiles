function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
  noremap  ,w :w<CR>
  noremap! ,w <ESC>:w<CR>
  noremap  ,q :q<CR>
  noremap! ,q <ESC>:q<CR>
  noremap  ,e :wq<CR>
  noremap! ,e <ESC>:wq<CR>
  noremap  ,z :q!<CR>
  noremap! ,z <ESC>:q!<CR>

  nnoremap <silent> ,t :FZF<cr>

  imap jj <ESC>

  set ic
  set smartcase
  set incsearch
  set nohlsearch
  set inccommand=split
endfunction
