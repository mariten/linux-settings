" Vim color file
" Maintainer:   Jeff Case
" Last Change:  Apr 23 2017
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "jeff"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" Console
highlight Normal         ctermfg=Grey             ctermbg=Black
highlight Cursor         ctermfg=Black            ctermbg=Green            cterm=bold
highlight StatusLine     ctermfg=Blue             ctermbg=White
highlight Visual         ctermfg=White            ctermbg=DarkGreen
highlight Search         ctermfg=Black            ctermbg=Yellow            cterm=NONE
highlight LineNr         ctermfg=Black            ctermbg=White

highlight Identifier     ctermfg=Magenta
highlight Statement      ctermfg=Cyan                                      cterm=bold
highlight Type           ctermfg=Cyan                                      cterm=bold
highlight Function       ctermfg=White
highlight PreProc        ctermfg=Cyan
highlight Operator       ctermfg=White
highlight Constant       ctermfg=DarkRed                                   cterm=bold
highlight Number         ctermfg=LightBlue
highlight Float          ctermfg=LightBlue
highlight Boolean        ctermfg=LightBlue
highlight Comment        ctermfg=DarkGreen
highlight Special        ctermfg=Brown

highlight DiffChange     ctermbg=Magenta        ctermfg=Yellow
highlight DiffText       ctermbg=Blue           ctermfg=White

" only for vim
