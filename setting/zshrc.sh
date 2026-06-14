alias ..='cd ..'
alias ls='ls -ohG'
alias la='ls -a'
alias lt='ls -tr'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ju='julia --project'
delete() {
    find . -name '.DS_Store' -delete
}
change() {
    if [[ "$PWD" != "$HOME"/* ]]; then
        return
    fi
    find . \( -name .git -prune \) -or -type d -exec chmod 755 {} +
    find . \( -name .git -prune \) -or -type f -exec chmod 644 {} +
}
clean() {
    if [[ "$PWD" != "$HOME"/* ]]; then
        return
    fi
    jlfmt --margin=80 --format_markdown --always_for_in --whitespace_typedefs --import_to_using --pipe_to_function_call --short_to_long_function_def --format_docstrings --inplace .
    runic --extensions=jl,md --inplace .
    shfmt --indent 4 --binary-next-line --case-indent --space-redirects --write .
    stylua --column-width 80 --indent-type Spaces .
    prettier --tab-width 4 --write .
}
project() {
    for pa in **/Project.toml; do
        (
            cd "$(dirname "$pa")"
            echo "📍 $(pwd)"
            help template
            ju --eval 'using Pkg: update; update()'
        )
    done
}
git1() {
    for pa in **/.git; do
        (
            cd "$(dirname "$pa")"
            echo "📍 $(pwd)"
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
            echo "📍 $(pwd)"
            git add --all
            git commit --message "$1"
            git push
        )
    done
}
PROMPT='%B%~%b '
RPROMPT=' %B%*%b'
