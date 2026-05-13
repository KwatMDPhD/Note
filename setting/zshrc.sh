setopt autocd

alias cp="cp -i"

alias mv="mv -i"

alias rm="rm -i"

alias ls="ls -lhG"

alias la="ls -A"

alias lt="ls -tr"

alias ju="julia --project"

ch() {

  find . -type d -exec chmod 755 {} +

  find . -type f -exec chmod 644 {} +

}

cl() {

  find . -name .DS_Store -delete

  runic --extensions=jl,md --inplace .

  find -E . -type f -regex ".*\.(sh|html|md|lua|json|toml)" ! -regex ".*/(\.git|node_modules|ou)/.*" ! -regex ".*/(package\.json|Manifest\.toml|msigdb.*\.json)" -print0 | xargs -0 prettier --plugin /opt/homebrew/lib/node_modules/prettier-plugin-sh/lib/index.js --plugin /opt/homebrew/lib/node_modules/prettier-plugin-tailwindcss/dist/index.mjs --plugin /opt/homebrew/lib/node_modules/@prettier/plugin-lua/src/index.js --plugin /opt/homebrew/lib/node_modules/prettier-plugin-toml/lib/index.js --write

}

h1() {

  for di in **/*.jl; do

    [[ -d "$di" ]] || continue

    (

      cd "$di"

      echo "📍 $(pwd)"

      he match

      julia --project --eval 'using Pkg; Pkg.update()'

    )

  done

}

g1() {

  for gi in **/.git; do

    (

      cd "${gi:h}"

      echo "📍 $(pwd)"

      git fetch

      git status --short --branch

      git diff

    )

  done

}

g2() {

  for gi in **/.git; do

    (

      cd "${gi:h}"

      echo "📍 $(pwd)"

      git add --all

      git commit --message "$1"

      git push

    )

  done

}

PROMPT="%B%~%b "

RPROMPT=" %B%*%b"
