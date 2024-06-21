# My Dotfiles

dotfiles will now be managed via GNU/stow

Stow [video](https://www.youtube.com/watch?v=y6XCebnB9gs)

## Requirements

### Git

```bash
sudo apt install git
```

### Stow

```bash
sudo apt install stow
```

## Installation

```bash
cd $HOME

git clone https://github.com/pongpatapee/dotfiles.git

cd dotfiles

stow .
```

## Note

To stow `xorg.conf.d` in particular run

```bash
cd ~/dotfiles/.config
stow --target=/etc/X11/xorg.conf.d xorg.conf.d
```
