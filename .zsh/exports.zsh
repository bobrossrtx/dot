# Path
PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$HOME/go/bin:$PATH
PATH=$HOME/.bin:$PATH

export PATH

# General
export ZSH="$HOME/.oh-my-zsh"
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export ARCHFLAGS="-arch x86_64"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# dotbare
export DOTBARE_DIR="$HOME/.cfg"
export DOTBARE_TREE="$HOME"

# Editor
export VISUAL=nvim
export EDITOR=$VISUAL
