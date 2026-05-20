alias ..='cd ..'

alias cp='cp -i'

alias mv='mv -i'

alias rm='rm -i'

alias ls='ls -Glh'

alias la='ls -A'

alias lt='ls -tr'

alias ju='julia --project'

ch() {

  if [[ $PWD == $HOME ]]; then

    echo '🚨 ~'

    return

  fi

  find . -type d -exec chmod 755 {} +

  find . -type f -exec chmod 644 {} +

}

cl() {

  find . -name .DS_Store -delete

  if [[ $PWD == $HOME ]]; then

    echo '🚨 ~'

    return

  fi

  jlfmt --margin=80 --format_markdown --always_for_in --whitespace_typedefs --import_to_using --pipe_to_function_call --short_to_long_function_def --format_docstrings --inplace .

  runic --extensions=jl,md --inplace .

  find -E . -type f -regex '.*\.(sh|html|md|lua|json)' ! -regex '.*/(\.git/.*|node_modules/.*|ou/.*|package\.json|msigdb.*\.json)' -print0 | xargs -0 prettier --plugin /opt/homebrew/lib/node_modules/prettier-plugin-sh/lib/index.js --plugin /opt/homebrew/lib/node_modules/prettier-plugin-tailwindcss/dist/index.mjs --plugin /opt/homebrew/lib/node_modules/@prettier/plugin-lua/src/index.js --write

}

h1() {

  for di in **/*.jl; do

    if [[ ! -d "$di" ]]; then

      continue

    fi

    (

      cd "$di"

      echo "📍 $(pwd)"

      help te

      julia --project --eval 'using Pkg: update; update()'

    )

  done

}

g1() {

  for gi in **/.git; do

    (

      cd "$(dirname "$gi")"

      echo "📍 $(pwd)"

      git fetch

      git status --short

      git diff

    )

  done

}

g2() {

  for gi in **/.git; do

    (

      cd "$(dirname "$gi")"

      echo "📍 $(pwd)"

      git add --all

      git commit --message "$1"

      git push

    )

  done

}

PROMPT='%B%~%b '

RPROMPT=' %B%*%b'
