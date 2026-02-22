# Dotfiles

Personal Linux configuration managed with [GNU Stow].

## Managed

- nvim -> kickstart.nvim
- zsh
- tmux
- kitty

## Setup

```bash
git clone https://github.com/GeekyProgrammer07/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow editor shell tmux kitty
```

[GNU Stow]: https://www.gnu.org/software/stow/