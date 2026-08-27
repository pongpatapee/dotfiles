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

## Agent instructions

`AGENTS.md` is the single source of truth for agent instructions.
`.claude/CLAUDE.md` is a symlink to it, so Claude Code picks up the same file.

On a **fresh machine**, create `~/.claude` before stowing, otherwise stow will
fold the whole directory into a symlink and Claude Code's runtime state
(`projects/`, `todos/`, `shell-snapshots/`) will end up inside this repo:

```bash
mkdir -p ~/.claude
cd ~/dotfiles && stow .
```
