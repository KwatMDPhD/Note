# =============================================================================================== #
# Alias
# ----------------------------------------------------------------------------------------------- #

alias ls="ls -hG"

alias ll="ls -l"

alias la="ls -lA"

alias lt="ls -ltr"

alias tree="tree -h"

alias du="du -h"

alias find="find -E"

alias grep="grep --color --ignore-case"

alias cp="cp -i"

alias mv="mv -i"

alias rm="rm -i"

alias rsync="rsync --archive --verbose --itemize-changes --human-readable --progress --stats"

alias scs="screen -S 1"

alias scr="screen -r"

alias ne="neovide &!"

alias ju="julia --project"

alias ..="cd .."

alias ...="cd ../.."

# =============================================================================================== #
# Kata
# ----------------------------------------------------------------------------------------------- #

function kata-clean {

  kata delete

  kata beautify

}

function kata-sync {

  for di in $(find -E . -type d -regex ".*\.(jl|pr)" -not -regex ".*node_modules.*"); do

    pushd $di

    kata match

    julia --project --eval "using Pkg; Pkg.update()"

    popd

  done

  kata festdi

  kata adcopu $1

}

# =============================================================================================== #
# Style
# ----------------------------------------------------------------------------------------------- #

PROMPT="%B%~%b "

RPROMPT=" %B%*%b"

# =============================================================================================== #
# Environment
# ----------------------------------------------------------------------------------------------- #

eval "$(/opt/homebrew/bin/brew shellenv)"

PATH=~/.julia/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# =============================================================================================== #
# Run
# ----------------------------------------------------------------------------------------------- #

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/kwat/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
