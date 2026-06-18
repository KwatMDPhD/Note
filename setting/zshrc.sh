alias ..='cd ..'
alias ls='ls -ohG'
alias la='ls -a'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ju='julia --project'
delete() {
    find . -name '.DS_Store' -delete
}
name() {
    if [[ "$PWD" != "$HOME"/* ]]; then
        return
    fi
    find -E . -iregex '.*\.(jpg|jpeg)$' -print0 | xargs -0 rename 's/\.(jpe?g)$/.jpeg/i'
    find -E . -iregex '.*\.png$' -print0 | xargs -0 rename 's/\.png$/.png/i'
}
change() {
    if [[ "$PWD" != "$HOME"/* ]]; then
        return
    fi
    find . \( -name '.git' -prune \) -or -type d -exec chmod 755 {} +
    find . \( -name '.git' -prune \) -or -type f -exec chmod 644 {} +
}
clean() {
    if [[ "$PWD" != "$HOME"/* ]]; then
        return
    fi
    #jlfmt --margin=80 --format_markdown --always_for_in --whitespace_typedefs --import_to_using --pipe_to_function_call --short_to_long_function_def --format_docstrings --inplace .
    runic --extensions=jl,md --inplace .
    prettier --tab-width 4 --plugin /opt/homebrew/lib/node_modules/prettier-plugin-tailwindcss/dist/index.mjs --write .
    shfmt --indent 4 --binary-next-line --case-indent --space-redirects --write .
    stylua --column-width 80 --indent-type Spaces .
}
project() {
    for pa in **/Project.toml; do
        (
            cd "$(dirname "$pa")"
            echo "📍 $PWD"
            help template
            ju --eval 'using Pkg: update; update()'
        )
    done
}
git1() {
    for pa in **/.git; do
        (
            cd "$(dirname "$pa")"
            echo "📍 $PWD"
            git fetch
            git status
            git diff
        )
    done
}
git2() {
    for pa in **/.git; do
        (
            cd "$(dirname "$pa")"
            echo "📍 $PWD"
            git add --all
            git commit --message "$1"
            git push
        )
    done
}
PROMPT='%B%~%b '
RPROMPT=' %B%*%b'
