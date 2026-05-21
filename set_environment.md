Install [brew](https://brew.sh).

```zsh
brew analytics off
```

```zsh
brew install node ripgrep rename

brew install --cask neovide
```

```zsh
npm --global install prettier prettier-plugin-sh @prettier/plugin-lua prettier-plugin-tailwindcss md-to-pdf
```

Install [julia](https://julialang.org/install).

```julia
using Pkg: add as Pkgadd

using Pkg.Apps: add as Appsadd

Pkgadd("BenchmarkTools")

Pkgadd("Revise")

Appsadd("JuliaFormatter")

Appsadd("Runic")

#]app dev ~/cr/Help.jl
```

```zsh
git config --global user.name ''

git config --global user.email ''

git config --global credential.helper osxkeychain

git config --global fetch.prune true

git config --global diff.colorMoved zebra
```

Install [grok](https://github.com/superagent-ai/grok-cli).

```zsh
mkdir -p ~/.config/nvim ~/.julia/config

ln -s ~/cr/Note/setting/zprofile.sh ~/.zprofile

ln -sf ~/cr/Note/setting/zshrc.sh ~/.zshrc

ln -s ~/cr/Note/setting/init.lua ~/.config/nvim

ln -s ~/cr/Note/setting/startup.jl ~/.julia/config
```

```zsh
brew update

brew upgrade --greedy

brew autoremove

brew cleanup --prune=all

brew doctor

brew leaves

npm --global install npm@latest

npm --global upgrade

julia --eval 'using Pkg: update; update()'

grok --update
```
