alias ..="cd .."

alias ...="cd ../.."

alias ....="cd ../../.."

alias cp="cp -i"

alias mv="mv -i"

alias rm="rm -i"

alias ls="ls -lhG"

alias la="ls -A"

alias lt="ls -tr"

alias ju="julia --project"

function ch {

  find . -type d -exec chmod 755 {} + -o -type f -exec chmod 644 {} +

  runic --extensions=jl,md --inplace .

}

function cl {

  find . -name .DS_Store -delete

  runic --extensions=jl,md --inplace .

  find -E . -type f -regex ".*\.(sh|html|md|lua|json|toml)" ! -regex ".*/(\.git|node_modules|ou)/.*" ! -regex ".*/(package\.json|Manifest\.toml|msigdb.*\.json)" -print0 | xargs -0 prettier --plugin /opt/homebrew/lib/node_modules/prettier-plugin-sh/lib/index.js --plugin /opt/homebrew/lib/node_modules/prettier-plugin-tailwindcss/dist/index.mjs --plugin /opt/homebrew/lib/node_modules/@prettier/plugin-lua/src/index.js --plugin /opt/homebrew/lib/node_modules/prettier-plugin-toml/lib/index.js --write

}

function fsd {
}

function acp {
}

function sy {

  for di in $(find -E . -type d -regex ".*\.jl"); do

    pushd $di

    te match

    julia --project --eval "using Pkg; Pkg.update()"

    popd

  done

}

PROMPT="%B%~%b "

RPROMPT=" %B%*%b"
