alias ..="cd .."

alias ...="cd ../.."

alias ....="cd ../../.."

alias cp="cp -i"

alias mv="mv -i"

alias rm="rm -i"

alias rsync="rsync --archive --verbose --itemize-changes --human-readable --progress --stats"

alias ls="ls -G"

alias ll="ls -lh"

alias la="ls -lhA"

alias lt="ls -lhtr"

alias tree="tree -h"

alias grep="grep --color --ignore-case"

alias ju="julia --project"

function ch {

  find . -type d -exec chmod 755 {} + -o -type f -exec chmod 644 {} +

}

function cl {

  kata delete

  kata beautify

}

function sy {

  for di in $(find -E . -type d -regex ".*\.(jl|pr)" -not -regex ".*node_modules.*"); do

    pushd $di

    kata match

    julia --project --eval "using Pkg; Pkg.update()"

    popd

  done

  kata fsd

  kata acp "$1"

}

PROMPT="%B%~%b "

RPROMPT=" %B%*%b"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/kw/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
