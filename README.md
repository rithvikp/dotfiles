# dotfiles
My configuration files

## Neovim
init.vim
coc-settings.json
### Install Neovim
- Install [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Copy init.vim to ~/.config/nvim/init.vim
- Install fzf (`brew install fzf`) and optionally ripgrep (`brew install ripgrep`)
- Install python 3 along with the [pynvim](https://github.com/neovim/pynvim)
- Install [vim-plug](https://github.com/junegunn/vim-plug)
- Run `:PlugInstall` in neovim

### Setup Autocomplete
- Install Node.js.
- Use the `:CocInstall <package name>` command to install autocompletion for different languages/file
  types. [Here](https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim) is more information
  about that. Make sure to install `coc-snippets` as well.
- More instructions for configuring coc.nvim are [here](https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file)).
