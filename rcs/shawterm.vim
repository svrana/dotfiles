" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "shawterm"
"
"" Common groups that link to default highlighting.
"" You can specify other highlighting easily.
"hi link String	Constant
"hi link Character	Constant
"hi link Number	Constant
"hi link Boolean	Constant
"hi link Float		Number
"hi link Conditional	Repeat
"hi link Label		Statement
"hi link Keyword	Statement
"hi link Exception	Statement
"hi link Include	PreProc
"hi link Define	PreProc
"hi link Macro		PreProc
"hi link PreCondit	PreProc
"hi link StorageClass	Type
"hi link Structure	Type
"hi link Typedef	Type
"hi link Tag		Special
"hi link SpecialChar	Special
"hi link Delimiter	Special
"hi link SpecialComment Special
"hi link Debug		Special

"
" Set normal first as its setting can alter others
" (Setting normal fracks up paste mode, wtf)
"
"hi Normal 		ctermfg=gray ctermbg=black
hi Comment 		ctermfg=darkgray
hi Statement 	ctermfg=yellow 	" if/for, etc.
hi Special 		ctermfg=cyan
hi SpellBad  	ctermbg=cyan term=bold
hi Todo 		ctermfg=darkblue ctermbg=red term=bold
hi Directory 	ctermfg=darkgreen
hi StatusLine 	ctermfg=lightblue ctermbg=white
hi preproc 		ctermfg=darkgreen
hi Cursor 		ctermbg=red ctermfg=NONE
hi FoldColumn 	guibg=darkblue
hi Label		ctermfg=yellow
" Added for FuzzyFinder foreground clash
hi PmenuSel     ctermfg=white
"  laptop doesn't work with this setting
"hi Normal 		ctermfg=white ctermbg=black guifg=white guibg=black
"hi Normal 		ctermfg=gray ctermbg=black
