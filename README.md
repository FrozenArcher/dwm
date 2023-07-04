# DWM
A dynamic window manager - FrozenArcher's fork

## Installation

Make sure `/usr/local/bin` is in your `PATH`!

```bash
git clone git@github.com:FrozenArcher/dwm.git $HOME/dwm
cd $HOME/dwm
git submodule init
git submodule update
sudo ./install
```

## Configuration

* edit `dwm.desktop` to change `$DWM_DIR` and `$DWM_BAR`.
* edit `config-dwm.h` to configure dwm. (dwm's config.h)
* edit `config-dwmblocks.h/.c` to configure dwmblocks. (dwmblocks-async's config.h/.c)

## Launching

Via a display manager or in your `.xinitrc`, add:

```bash
launch_dwm
```

## Patches

* actualfullscreen
* barpadding
* colorbar
* fancybar
* pertag
* preserveonrestart
* status2d
* statuscmd
* statuspadding
* systray
* underlinetags
* vanitygaps
