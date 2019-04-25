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


  function! GotoDotfiles()
      cd $DOTFILES
  endfun

  map  \cf :call GetFile(expand("$DOTFILES"))<CR>
  map! \cf <ESC>:call GetFile(expand("$DOTFILES"))<CR>

  map  \gc :call GotoDotfiles()<CR>
  map! \gc <ESC>:call GotoDotfile()<CR>


  map  <m-n> :cn<CR>
  map! <m-n> <ESC>:cn<CR>
  map  <m-p> :cp<CR>
  map! <m-p> <ESC>:cp<CR>
  map  <m-f> :cfirst<CR>
  map! <m-f> <ESC>:cfirst<CR>
  map  <m-l> :clist<CR>
  map! <m-l> <ESC>:clist<CR>
  map  <m-o> :copen<CR>
  map! <m-o> <ESC>:copen<CR>

  imap jj <ESC>

  "====[ Highlight matches when jumping to next ]====
  " OR ELSE just highlight the match in red... (Damian Conway)
  nnoremap <silent> n     n:call HLNext(0.4)<cr>
  nnoremap <silent> N     N:call HLNext(0.4)<cr>
  highlight WhiteOnRed ctermfg=white ctermbg=red
  function! HLNext (blinktime)
      let [bufnum, lnum, col, off] = getpos('.')
      let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
      let target_pat = '\c\%#'.@/
      let ring = matchadd('WhiteOnRed', target_pat, 101)
      redraw
      exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
      call matchdelete(ring)
      redraw
  endfunction


  hi IncSearch ctermbg=LightYellow ctermfg=Red



endfunction
