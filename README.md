# Using the dotfiles

## Tmux

## oh-my-posh

- The .bashrc is configured to use the theme right from the repository so if the location is changed remember to add the path to the .bashrc
```eval "$(oh-my-posh init bash -c /path/to/theme.omp.json)"```

## Emacs' init.el

- Add the init.el to your emacs config using `ln -s /path/to/dotfiles/init.el /path/to/.emacs.d/init.el`. (for now)


## Startup.sh

startup.sh is to be added to `/etc/profile.d/` and it contains:

- A block to check if the emacs daemon is running.
- `feh` command to set the wallpaper.
- `slstatus &` to configure the status bar.
- `picom &` to configure transparency.

---
# TODO

1. Make an install.sh
