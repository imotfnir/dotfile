# Install
```bash
git clone --depth=1 https://github.com/imotfnir/dotfile ~/.my-dotfile
sh ~/.my-dotfile/install.sh install
git config --global include.path ~/.my-git.conf
```


# Good apps config finish by other contributors
- https://github.com/amix/vimrc
```bash
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh
python update_plugins.py
```

# TUI tools
```bash
apt install golang-go
go install github.com/jesseduffield/lazydocker@latest
go install github.com/jesseduffield/lazygit@latest
```
