" My Autopairing keymaps

" Single line
" Brackets
inoremap {; {};<Left><Left>
inoremap (; ();<Left><Left>
inoremap [; [];<Left><Left>
inoremap <; <>;<Left><Left>
inoremap {, {},<Left><Left>
inoremap (, (),<Left><Left>
inoremap [, [],<Left><Left>
inoremap <, <>,<Left><Left>
inoremap {} {}<Left>
inoremap () ()<Left>
inoremap [] []<Left>
inoremap <> <><Left>

" Quotes
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>
inoremap "; "";<Left><Left>
inoremap '; '';<Left><Left>
inoremap `; ``;<Left><Left>
inoremap ", "",<Left><Left>
inoremap ', '',<Left><Left>
inoremap `, ``,<Left><Left>

" Multi-line
" Brackets
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap {;<CR> {<CR>};<Esc>O
inoremap (;<CR> (<CR>);<Esc>O
inoremap [;<CR> [<CR>];<Esc>O
inoremap {,<CR> {<CR>},<Esc>O
inoremap (,<CR> (<CR>),<Esc>O
inoremap [,<CR> [<CR>],<Esc>O

" Quotes
inoremap ```<CR> ```<CR>```<Esc>O

" Replace surrounding pairs
" Brackets
nnoremap rs({ F(r{f)r}
nnoremap rs([ F(r[f)r]
nnoremap rs(< F(r<f)r>
nnoremap rs(' F(r'f)r'
nnoremap rs(" F(r"f)r"
nnoremap rs(` F(r`f)r`

nnoremap rs[{ F[r{f]r}
nnoremap rs[( F[r(f]r)
nnoremap rs[< F[r<f]r>
nnoremap rs[' F[r'f]r'
nnoremap rs[" F[r"f]r"
nnoremap rs[` F[r`f]r`

nnoremap rs{( F{r(f}r)
nnoremap rs{[ F{r[f}r]
nnoremap rs{< F{r<f}r>
nnoremap rs{' F{r'f}r'
nnoremap rs{" F{r"f}r"
nnoremap rs{` F{r`f}r`

nnoremap rs<( F<r(f>r)
nnoremap rs<[ F<r[f>r]
nnoremap rs<{ F<r{f>r}
nnoremap rs<' F<r'f>r'
nnoremap rs<" F<r"f>r"
nnoremap rs<` F<r`f>r`

" Quotes
nnoremap rs'" F'r"f'r"
nnoremap rs'` F'r`f'r`
nnoremap rs'( F'r(f'r)
nnoremap rs'[ F'r[f'r]
nnoremap rs'{ F'r{f'r}
nnoremap rs'< F'r<f'r>

nnoremap rs"' F"r'f"r'
nnoremap rs"` F"r`f"r`
nnoremap rs"( F"r(f"r)
nnoremap rs"[ F"r[f"r]
nnoremap rs"{ F"r{f"r}
nnoremap rs"< F"r<f"r>

nnoremap rs`" F`r"f`r"
nnoremap rs`' F`r'f`r'
nnoremap rs`( F`r(f`r)
nnoremap rs`[ F`r[f`r]
nnoremap rs`{ F`r{f`r}
nnoremap rs`< F`r<f`r>

" Surround visually selected expressions
" Brackets
function VLinePairs(pair_char1, pair_char2)
	exec "norm I".a:pair_char1
	exec "norm A".a:pair_char2
endfunction

xno <silent> <expr> ( {"v":		"c()\<Esc>P",
			\ "V":		":call VLinePairs('(', ')')\<CR>",
			\ "\<c-v>": "I(\<Esc>gv\<Right>A)\<Esc>",
			\ }[mode()]

xno <silent> <expr> { {"v":		"c{}\<Esc>P",
			\ "V":		":call VLinePairs('{', '}')\<CR>",
			\ "\<c-v>": "I{\<Esc>gv\<Right>A}\<Esc>",
			\ }[mode()]

xno <silent> <expr> [ {"v":		"c[]\<Esc>P",
			\ "V":		":call VLinePairs('[', ']')\<CR>",
			\ "\<c-v>": "I[\<Esc>gv\<Right>A]\<Esc>",
			\ }[mode()]

xno <silent> <expr> < {"v":		"c<>\<Esc>P",
			\ "V":		":call VLinePairs('<', '>')\<CR>",
			\ "\<c-v>": "I<\<Esc>gv\<Right>A>\<Esc>",
			\ }[mode()]
" Quotes
xno <silent> <expr> " {"v":		"c\"\"\<Esc>P",
			\ "V":		":call VLinePairs('\"', '\"')\<CR>",
			\ "\<c-v>": "I\"\<Esc>gv\<Right>A\"\<Esc>",
			\ }[mode()]

xno <silent> <expr> ' {"v":		"c''\<Esc>P",
			\ "V":		":call VLinePairs(\"'\", \"'\")\<CR>",
			\ "\<c-v>": "I'\<Esc>gv\<Right>A'\<Esc>",
			\ }[mode()]

xno <silent> <expr> ` {"v":		"c``\<Esc>P",
			\ "V":		":call VLinePairs('`', '`')\<CR>",
			\ "\<c-v>": "I`\<Esc>gv\<Right>A`\<Esc>",
			\ }[mode()]

" Delete surrounding pairs
" Brackets
nnoremap ds( di(<Left>P<Right>2x
nnoremap ds[ di[<Left>P<Right>2x
nnoremap ds{ di{<Left>P<Right>2x
nnoremap ds< di<<Left>P<Right>2x

" Quotes
nnoremap ds" di"<Left>P<Right>2x
nnoremap ds' di'<Left>P<Right>2x
nnoremap ds` di`<Left>P<Right>2x
