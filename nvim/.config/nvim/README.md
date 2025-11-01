# neovimrc

My personal Neovim configuration focusing on Rust development.

## Plugins used

Below you'll find a breakdown of the plugins I use, organized by functionality.

### LSP Setup

- treesitter - _for parsing syntax_
- lspconfig - _handles all LSP related setup_
- format-on-save
- rustaceanvim - _automagical setup and conf for Rust development_

### Editing QoL

- undotree - _undo history tool_

### Navigation

- nvim-tree - _an alternative to the netrw directory experience_
- harpoon - _for jumping between files_
- telescope - _great fuzzy finder_

### Theming

- colorscheme - _contains installed colorschemes, and sets a default one._

### Fun stuff

- cellular-automaton - _just for fun_
- vim-be-good - _a handful of educational games for practicing vim motions_

### VCS Tooling

- vim-fugitive - _Git integration_

## Tips and tricks

Make neovim and your neovim config more accessible in bash using a `.bashrc` alias: 

```bash
alias v=nvim
alias vc="nvim ~/.config/nvim"
```

or in PowerShell by editing the $profile file:

```powershell
function configureNvim {
    nvim C:\Users\nilsi\AppData\Local\nvim
}

Set-Alias v nvim
Set-Alias vc configureNvim
```



## Gotchas

TODO...
