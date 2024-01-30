# Using the dotfiles

## Tmux

### [TODO]

## oh-my-posh

- The .bashrc is configured to use the theme right from the repository so if the location is changed remember to add the path to the .bashrc
```eval "$(oh-my-posh init bash -c /path/to/theme.omp.json)"```
In this case the theme is located at `~/.dotfiles/ohmyposhtheme.omp.json`


## Emacs' init.el

- Add the init.el to your emacs config using `ln -s /path/to/dotfiles/init.el /path/to/.emacs.d/init.el`. (for now)


## Startup.sh

startup.sh is to be added to `/etc/profile.d/`.

```shell
sudo ln -s ~/.dotfiles/startup.sh /etc/profile.d/startup.sh
```

- Start sddm
```shell
sudo systemctl start sddm
```


- `feh` command to set the wallpaper.

```shell
feh --bg-scale /path/to/wallpaper
```
In this case the wallpaper is at `~/suckless/Wallpaper.jpg`.


- `slstatus &` to configure the status bar.


- Start `dunst`. (for notifications)

``` shell
if pgrep -x "dunst" > /dev/null; then
  :
else
  dunst -conf /path/to/config &
fi
```
In this case the config file is at `~/.dotfiles/dunst/dunstrc`


- `picom &` to configure transparency.

```shell
if pgrep -x "picom" > /dev/null; then
    notify-send "Picom is Running"
else
    picom --config /path/to/config &
    notify-send "Picom is Started"
fi
```
In this case the config file is at `~/.config/picom/picom.conf`

- Run emacs daemon. 

```shell
if pgrep -x "emacs" > /dev/null; then
    notify-send "Emacs Daemon is Running"
else
    notify-send "Staring Emacs Daemon"
    emacs --daemon &
    notify-send "Emacs Daemon is Stared"
```
---
# TODO

1. Organize the README.md and preferably migrate to org mode.
2. Make an install.sh

