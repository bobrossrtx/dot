# vim:filetype=zsh

# Use bat to get difference from git
function batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}

# Change file extensions recursively
function change-extension() {
    foreach f (**/*.$1)
        mv $f $f:r.$2
    end
}

# Load .env files into shell environment
function envup() {
    if [ -f .env  ]; then
        export $(sed '/^ *#/ d' .env)
    else
        echo "No .env file found" 1>&2
        return 1
    fi
}

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

# Make directory and change into it.
function mcd() {
  mkdir -p "$1" && cd "$1";
}
