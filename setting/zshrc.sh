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

alias ne="neovide &!"

alias ju="julia --project"

function ch {

  find . -type d -exec chmod 755 {} + -o -type f -exec chmod 644 {} +

}

function k1 {

  kata delete

  kata beautify

}

function k2 {

  for di in $(find -E . -type d -regex ".*\.(jl|pr)" -not -regex ".*node_modules.*"); do

    pushd $di

    kata match

    julia --project --eval "using Pkg; Pkg.update()"

    popd

  done

  kata festdi

  kata adcopu "$1"

}

PROMPT="%B%~%b "

RPROMPT=" %B%*%b"

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.julia/bin:$HOME/.juliaup/bin:$PATH"

#
