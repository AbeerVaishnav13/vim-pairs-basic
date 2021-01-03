# Vim Pairs Basic
This is a very basic implementation of auto-pairing of brackets and quotations for vim/neovim.

## Installation
Using `VimPlug`
```
Plug 'AbeerVaishnav13/vim-pairs-basic'
```

## Characters for Pair support
The following characters are supported for pair completion using vim-pairs-basic plugin:<br>
`(`, `{`, `[`, `<`, `'`, `"`, and \`

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

### Multi-line pairs
- Multi line brackets (the corresponding pair is displayed after pressing `<Enter>` key)
```
input: {<Enter>
output: {
	|
}
```

- Multi line brackets with `;` or `,`
```
input: {;<Enter>
output: {
	|
};

input: [,<Enter>
output: [
	|
],
```

### Replace Surrounding pairs
##### Usage pattern `rs<existing><change-to>`
- Example for quotations - `rs'"` has the following effect:
```
input text: 'Hello'
output text: "Hello"
```

- Example for brackets - `rs({` has the following effect:
```
input text: (2 + 3)
output text: {2 + 3}
```

- Example for quotation and bracket mixed - `rs'<` has the following effect:
```
input text: 'html'
output text: <html>
```

### Surround text with pairs
##### Steps
1. Visually select the text you want to surround with any of the supported pairs.
2. Press one of the supported pair characters for surrounding the selected text with them.
##### Example
- Input text
<img src='./images/hw.png' width=200 alt="Input text"/>

- Visual selection
<img src='./images/hw_visual.png' width=200 alt="Visual selected text"/>

- Pressing the `{` key for surrounding selected text with `{.}`
<img src='./images/hw_surrounded.png' width=200 alt="Surrounded text"/>
