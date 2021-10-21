# Path
PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$HOME/.local/bin/color-scripts:$PATH
PATH=$HOME/.local/bin/TinyKernel-Toolchain/bin:$PATH
PATH=$HOME/.config/composer/vendor/bin:$PATH
PATH=$HOME/go/bin:$PATH
PATH=$HOME/.bin:$PATH
PATH=$HOME/.emacs.d/bin:$PATH

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

# NNN
NNN_PLUG_INLINE='e:!go run $nnn*'
NNN_PLUG_DEFAULT='1:ipinfo;b:nbak'
NNN_PLUG_GENERAL='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
export NNN_PLUG="$NNN_PLUG_DEFAULT;$NNN_PLUG_GENERAL;$NNN_PLUG_INLINE"

