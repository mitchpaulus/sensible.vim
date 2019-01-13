set background=dark
highlight clear

" Reminder of default colors
" 0 = black
" 1 = red
" 2 = green
" 3 = yellow
" 4 = blue
" 5 = magenta
" 6 = cyan
" 7 = white

highlight Normal ctermfg=7 ctermbg=NONE

highlight LineNr ctermfg=1 ctermbg=NONE
highlight clear CursorLineNr
highlight link CursorLineNr LineNr

highlight Title ctermfg=4 ctermbg=NONE cterm=bold
highlight Cursor ctermfg=0 ctermbg=7
highlight Comment ctermfg=2 ctermbg=NONE
highlight Constant ctermfg=5 ctermbg=NONE

highlight SpellBad term=NONE ctermfg=1 ctermbg=NONE cterm=undercurl,bold

highlight clear SpellCap
highlight link SpellCap SpellBad

highlight clear SpellLocal
highlight link SpellLocal SpellBad

highlight clear SpellRare
highlight link SpellRare SpellBad

highlight Search ctermfg=0 ctermbg=3
