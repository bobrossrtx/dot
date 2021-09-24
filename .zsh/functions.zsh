# vim:filetype=zsh

function batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}
