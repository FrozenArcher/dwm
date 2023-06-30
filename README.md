# DWM
A dynamic window manager - FrozenArcher's fork

## Installation

```bash
git clone git@github.com:FrozenArcher/dwm.git $HOME/dwm
cd $HOME/dwm/dwmblocks
git submodule init
git submodule update
cd ..
sudo ./install
```

## Launching

Via a display manager or in your `.xinitrc`, add:

```bash
launch_dwm
```

## Patches

* barpadding
* colorbar
* fancybar
* preserveonrestart
* status2d
* statuscmd
* statuspadding
* underlinetags
* vanitygaps
