alias ..='cd ..'

alias cp='cp -i'

alias mv='mv -i'

alias rm='rm -i'

alias ls='ls -ohG'

alias la='ls -a'

alias lt='ls -tr'

alias ju='julia --project'

ch() {

  if [[ "$PWD" != "$HOME"/* ]]; then

    return

  fi

  find . \( -name .git -prune \) -or -type d -exec chmod 755 {} +

  find . \( -name .git -prune \) -or -type f -exec chmod 644 {} +

}

cl() {

  find . -name '.DS_Store' -delete

  if [[ "$PWD" != "$HOME"/* ]]; then

    return

  fi

  jlfmt --margin=80 --format_markdown --always_for_in --whitespace_typedefs --import_to_using --pipe_to_function_call --short_to_long_function_def --format_docstrings --inplace .

  runic --extensions=jl,md --inplace .

  find -E . -type f -regex '.*\.(sh|lua|html|md|json)' ! -regex '.*/(\.git/.*|package\.json|node_modules/.*|ou/.*|msigdb.*\.json)' -print0 | xargs -0 prettier --plugin /opt/homebrew/lib/node_modules/prettier-plugin-sh/lib/index.js --plugin /opt/homebrew/lib/node_modules/@prettier/plugin-lua/src/index.js --plugin /opt/homebrew/lib/node_modules/prettier-plugin-tailwindcss/dist/index.mjs --write

}

h1() {

  for pa in **/Project.toml; do

    (

      cd "$(dirname "$pa")"

      echo "📍 $(pwd)"

      help template

      ju --eval 'using Pkg: update; update()'

    )

  done

}

g1() {

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

g2() {

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
