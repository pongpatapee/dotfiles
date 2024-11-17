# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
)
plugins+=(zsh-vi-mode)
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# for zsh-completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh


# Inspired by zen zsh config (https://www.youtube.com/watch?v=ud7YxC33Z3w)
# Keybinds
# Will help cycle through history of a particular command rather than history of all commands
bindkey -e # emacs mode
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

## History config
# Share command history between sessions
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Shell integration
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Completion styling
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# adding GO to path
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin


# Starship prompt
eval "$(starship init zsh)"

################
# Nvim Switcher
################
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-scratch="NVIM_APPNAME=ScratchNvim nvim"
alias nvim-wh1fty="NVIM_APPNAME=wh1ftyNvim nvim"
alias nvim-mylazyvim="NVIM_APPNAME=mylazyvim nvim"

function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim" "ScratchNvim" "wh1ftyNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}


###########
# Env Vars
###########

export EDITOR=nvim

#############
# My Aliases
#############

alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="cd ~/.config/nvim"
alias tmuxconfig="cd ~/.config/tmux"
alias hyprlandconfig="cd ~/.config/hypr"
alias waybarconfig="cd ~/.config/waybar"
alias i3config="cd ~/.config/i3"
alias touchpadconfig="cd /etc/X11/xorg.conf.d"
alias desktopEntries="cd ~/.local/share/applications"
alias settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
# alias code="code --enable-ozone --ozone-platform=wayland"
alias game-selector="~/scripts/game-selector"
alias screen-saver="~/scripts/screen-savers"


##########################
# cd with lf file manager
##########################
function lfcd() {
    cd $(command lf -print-last-dir)
}

#############
# cd with fzf
#############
function fcd() {
    path_to_cd=$(find ~/ -type d -not -path "*.git*" | fzf)
    if [[ -z $path_to_cd ]]; then
        path_to_cd=$(pwd)
    fi

    cd $path_to_cd
}



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
