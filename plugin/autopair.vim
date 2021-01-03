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
vnoremap ( c()<Esc>P
vnoremap [ c[]<Esc>P
vnoremap { c{}<Esc>P
vnoremap < c<><Esc>P

" Quotes
vnoremap " c""<Esc>P
vnoremap ' c''<Esc>P
vnoremap ` c``<Esc>P
