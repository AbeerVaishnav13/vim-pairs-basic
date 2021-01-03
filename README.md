# Vim Pairs Basic
This is a very basic implementation of auto-pairing of brackets and quotations for vim/neovim.

## Installation
Using `VimPlug`
```
Plug 'AbeerVaishnav13/vim-pairs-basic'
```

## Characters for Pair support
The following characters are supported for pair completion using vim-pairs-basic plugin.
`(`, `{`, `[`, `<`, `'`, `"`, and ```

## Usage
### Single-line pairs
- Insert in pair
```
input: []
output: [|]

input: ""
output: "|"
```

- Insert with `;` or `,`
```
input: (;
output: (|);

input: ";
output: "|";

input: (,
output: (|),

input: ",
output: "|",
```


