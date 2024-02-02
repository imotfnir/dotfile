# Install

Set soft link to nvim and tmux
```
git clone https://github.com/imotfnir/dotfile ~/.dotfile
mkdir -p ~/.config/nvim && ln -s ~/.dotfile/neovim/* ~/.config/nvim
ln -s ~/.dotfile/tmux/.tmux/.* ~
```

Install lua packer.nvim

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Install legacy nvim plugin manager

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Init plugin manager

```
nvim
:PackerSync
:PlugInstall
```
