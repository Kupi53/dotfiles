# DotFiles
This repositories is used to store all my personnal configurations

## Symlink after cloning 

```bash
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/.config/nvim/ ~/.config/nvim
```
## GNU Stow

Use GNU Stow for automating your symbol linking with the command below, note that thi repo needs to be cloned in the home directory otherwise you have to specify the source and destination
```bash
# If dotfiles is in the home directory.
stow .

# Otherwise
stow --dir=<'full path of src dir'> --target=<'full path of dest dir'>

# OR
stow -d <'fullpath of src dir'> -t <'full path of dest dir'>
```
[GNU Stow Manual](https://www.gnu.org/software/stow/manual/)



