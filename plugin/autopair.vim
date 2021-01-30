" My Autopairing keymaps
let g:pair_dict ={'{':['{','}'],
			\'}':['{','}'],
			\'(':['(', ')'],
			\')':['(', ')'],
			\'[':['[', ']'],
			\']':['[', ']'],
			\'<':['<', '>'],
			\'>':['<', '>'],
			\'"':['"', '"'],
			\"'":["'", "'"],
			\'`':['`', '`']}

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
	let s:input1 = nr2char(getchar())
	if s:input1 == "\<c-c>"
		return
	endif
	let s:first_pair = g:pair_dict[s:input1]
	let s:input2 = nr2char(getchar())
	if s:input2 == "\<c-c>"
		return
	endif
	let s:second_pair = g:pair_dict[s:input2]
	exec "norm F".s:first_pair[0]."r".s:second_pair[0]."f".s:first_pair[1]."r".s:second_pair[1]
endfunction

nnoremap rs :call ReplaceSurrounding()<CR>

" Surround visually selected expressions
function SurroundWithPairs(curr_mode)
	let s:input = nr2char(getchar())
	if s:input == "\<c-c>"
		return
	endif
	let s:surr_pair = g:pair_dict[s:input]

	if a:curr_mode == 'v'
		exec "norm gv"
		exec "norm c".s:surr_pair[0].s:surr_pair[1]
		exec "norm P"
	elseif a:curr_mode == 'V'
		exec "'<,'>norm I".s:surr_pair[0]
		exec "'<,'>norm A".s:surr_pair[1]
	elseif a:curr_mode == 'c-v'
		exec "norm gvI".s:surr_pair[0]
		exec "norm gvkA".s:surr_pair[1]
	endif
endfunction

xno <expr> as {"v":	":call SurroundWithPairs('v')\<CR>",
					\ "V":		"\<Esc>:call SurroundWithPairs('V')\<CR>",
					\ "\<c-v>": "\<Esc>:call SurroundWithPairs('c-v')\<CR>",
					\ }[mode()]

" Delete surrounding pairs
function DeleteSurrounding(curr_mode)
	let s:del_pair = g:pair_dict[nr2char(getchar())][0]

	if a:curr_mode == 'n'
		exec "norm di".s:del_pair."bPw2x"
	elseif a:curr_mode == 'c-v'
		exec "'<,'>norm di".s:del_pair."bPw2x"
	endif
endfunction

xno <expr> ds {"\<c-v>": "\<Esc>:call DeleteSurrounding('c-v')\<CR>"}[mode()]
nnoremap ds :call DeleteSurrounding('n')<CR>
