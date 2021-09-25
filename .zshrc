# .zshrc - zsh configuration file
# - Author: Owen Boreham
# - Date:   Mon, 13th September

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZSH_THEME="powerlevel10k/powerlevel10k"

source $HOME/.zsh/env.zsh
source $HOME/.zsh/exports.zsh

# Plugins

source $HOME/.dotbare/dotbare.plugin.zsh

plugins=(
    git
    node
    npm
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    k
) autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# Common CTRL bindings.
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^k" kill-line
bindkey "^d" delete-char
bindkey "^y" accept-and-hold
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^F" history-incremental-pattern-search-forward

# Do not require a space when attempting to tab-complete
bindkey "^i" expand-or-complete-prefix

# Fixes for alt-backspace and arrow keys
bindkey "^[^?" backward-kill-word
bindkey "^[[1;5C" forward-word

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/git-flow-completion.zsh
source ~/.zsh/functions.zsh

# zoxide
eval "$(zoxide init zsh)"

# ZPLUG plugins
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# zsh-users
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zshautosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Dir colors
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin

# Completions
zstyle ':completion:*' rehash true

# Case-insensitive (all), partial-word and then subsring completion
zstyle ":completion:*" matcher-list \
    "m:{a-zA-z}={A-Za-z}" \
    "r:|[._-]=* r:|=*" \
    "l:|=* r:|=*"

zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}

## Aliases
alias e="$EDITOR"
alias v="$VISUAL"

alias w="feh --bg-fill --randomize ~/Pictures/wallpapers"
alias wr="nitrogen --restore"
alias battery="acpi -b"
alias cls="clear"
alias frick="fuck"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias weather="clear && curl wttr.in"
alias v="nvim"
alias vim="v"
alias f="ranger"
alias tty="tty-clock -C6 -c -t"
alias pack="sudo apt-get"
alias commit="git add -A; git commit"
alias shot="flameshot gui"
alias kill="killall -q"
alias br="broot -sdp"

# Terminal maintenance
alias reset="cd ~; clear; source ~/.zshrc"
alias fetch="clear && neofetch"
alias todo="bat ~/Dropbox/Notes/todo.md"
alias todoe="nvim ~/Dropbox/Notes/todo.md"
alias config="dotbare"

# ptSH
alias pwd="ptpwd"
alias mkdir="ptmkdir -p"
alias touch="pttouch"

# Directory management
alias ls="exa --time-style=long-iso"
alias lah="ls -lah"
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"
alias d="dirs -v"
alias 1="pu"
alias 2="pu -2"
alias 3='pu -3'
alias 4='pu -4'
alias 5='pu -5'
alias 6='pu -6'
alias 7='pu -7'
alias 8='pu -8'
alias 9='pu -9'
alias pu="() { pushd $1 &> /dev/null; dirs -v; }"
alias po="() { popd $1 &> /dev/null; dirs -v; }"

# Snippets
alias ddate='date +"%R - %a, %B %d, %Y" | xclip -select clipboard && date +"%R - %a, %B %d, %Y"'
alias dday='date +"%Y.%m.%d - " | xclip -select clipboard ; date +"%Y.%m.%d"'

zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# Helpers
alias ccat="highlight -O ansi"
alias rm="rm -v"

# Command adaptations
alias grep="$(whence -p grep) --color=auto"
alias egrep="$(whence -p egrep) --color=auto"

## Generic options
setopt autocd
setopt append_history
setopt extended_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups

setopt pushd_ignore_dups
setopt pushd_minus

setopt extended_glob

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

WORDCHARS='`~!@#$%^&*()-_=+[{]}\|;:",<.>/?'"'"
watch=(notme)


## Terminal Emulator
# get terminal emulator
TERM_EMULATOR=$(ps -h -o comm -p $PPID)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $HOME/.config/broot/launcher/bash/br
source $HOME/.cargo/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
