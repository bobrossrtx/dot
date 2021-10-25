# .zshrc - zsh configuration file
# - Author: Owen Boreham
# - Date:   Mon, 13th September

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# ZSH_THEME="powerlevel10k/powerlevel10k"

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
alias edit="$EDITOR"
alias visual="$VISUAL"

alias j="z"
alias v="nvim"
alias vim="v"
alias em="emacs -nw"
alias emacs="emacsclient -c -a 'emacs'"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

alias w="feh --bg-fill --randomize ~/Pictures/wallpapers"
alias wr="nitrogen --restore"
alias battery="acpi -b"
alias frick="fuck"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias weather="clear && curl wttr.in"
alias f="ranger"
alias fa="f --cmd \"set show_hidden=true\""
alias tty="tty-clock -C6 -c -t"
alias pack="sudo apt-get"
alias commit="git add -A; git commit"
alias shot="flameshot gui"
alias kill="killall -q"

alias cls="clear"
alias c='clear && echo "" && pwd && ls'
alias clera='clear'
alias clea='clear'
alias chmox='chmod +x'

# Terminal maintenance
alias reset="cd ~; clear; source ~/.zshrc"
alias fetch="clear && neofetch"
alias todo="bat ~/Dropbox/Notes/todo.md"
alias todoe="nvim ~/Dropbox/Notes/todo.md"
alias config="dotbare"
alias jctl="journalctl -p 3 -xb"
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# termbin
alias tb="nc termbin.com 9999"
alias termbin="tb"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Directory management
# Changing "ls" to "exa"
alias ls='lsd -al' # my preferred listing
alias la='lsd -a'  # all files and dirs
alias ll='lsd -l'  # long format
alias l.='lsd -a | egrep "^\."'

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
# alias rm="rm -v"

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

source $HOME/.cargo/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opam configuration
test -r /home/owen/.opam/opam-init/init.zsh && . /home/owen/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval "$(starship init zsh)"
