" My Autopairing keymaps
let g:pair_dict ={'{':'}', '}':'{', '(':')', ')':'(', '[':']', ']':'[', '<':'>', '>':'<', '"':'"', "'":"'", '`':'`'}

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
inoremap "<CR> "<CR>"<Esc>O
inoremap '<CR> '<CR>'<Esc>O
inoremap `<CR> `<CR>`<Esc>O
inoremap ```<CR> ```<CR>```<Esc>O
inoremap ";<CR> "<CR>";<Esc>O
inoremap ';<CR> '<CR>';<Esc>O
inoremap `;<CR> `<CR>`;<Esc>O

" Replace surrounding pairs
function ReplaceSurrounding()
	let s:first_pair = nr2char(getchar())
	let s:second_pair = nr2char(getchar())
	exec "norm F".s:first_pair."r".s:second_pair."f".g:pair_dict[s:first_pair]."r".g:pair_dict[s:second_pair]
endfunction

nnoremap <silent> rs :call ReplaceSurrounding()<CR>

" Surround visually selected expressions
function SurroundWithPairs(curr_mode)
	let s:surr_char = nr2char(getchar())

	if a:curr_mode == 'v'
		exec "norm gvc".s:surr_char.g:pair_dict[s:surr_char]
		exec "norm p"
	elseif a:curr_mode == 'V'
		exec "norm gvI".s:surr_char
		exec "norm gvA".g:pair_dict[s:surr_char]
	elseif a:curr_mode == 'c-v'
		exec "norm gvI".s:surr_char
		exec "norm gvkA".g:pair_dict[s:surr_char]
	endif
endfunction

xno <silent> <expr> as {"v":	":call SurroundWithPairs('v')\<CR>",
					\ "V":		"\<Esc>:call SurroundWithPairs('V')\<CR>",
					\ "\<c-v>": "\<Esc>:call SurroundWithPairs('c-v')\<CR>",
					\ }[mode()]

" Delete surrounding pairs
function DeleteSurrounding(curr_mode)
	let s:del_char = nr2char(getchar())

	if a:curr_mode == 'n'
		exec "norm di".s:del_char."bPw2x"
	elseif a:curr_mode == 'c-v'
		exec "'<,'>norm di".s:del_char."bPw2x"
	endif
endfunction

xno <silent> <expr> ds {"\<c-v>": "\<Esc>:call DeleteSurrounding('c-v')\<CR>"}[mode()]
nnoremap <silent> ds :call DeleteSurrounding('n')<CR>
