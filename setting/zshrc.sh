alias ..="cd .."

alias ...="cd ../.."

alias cp="cp -i"

alias mv="mv -i"

alias rm="rm -i"

alias rsync="rsync --archive --verbose --itemize-changes --human-readable --progress --stats"

alias ls="ls -G"

alias ll="ls -lh"

alias la="ls -lhA"

alias lt="ls -lhtr"

alias du="du -h"

alias tree="tree -h"

alias find="find -E"

alias grep="grep --color --ignore-case"

alias ne="neovide &!"

alias ju="julia --project"

function clea {

  kata delete

  kata beautify

}

function syn {

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

export PATH="$HOME/ot/bi:$HOME/.julia/bin:$HOME/.juliaup/bin:$HOME/.pyenv/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(pyenv init -)"
