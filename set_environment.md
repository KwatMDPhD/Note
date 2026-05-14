Install [brew](https://brew.sh).

```zsh
brew analytics off
```

```zsh
brew install node ripgrep rename

brew install --cask neovide
```

```zsh
npm --global install prettier prettier-plugin-sh prettier-plugin-tailwindcss @prettier/plugin-lua md-to-pdf
```

Install [julia](https://julialang.org/install).

```julia
using Pkg

Pkg.add(["BenchmarkTools", "Revise"])

Pkg.Apps.add(["JuliaFormatter", "Runic"])

#]app dev ~/cr/He.jl
```

```zsh
git config --global user.name ""

git config --global user.email ""

git config --global credential.helper osxkeychain

git config --global fetch.prune true

git config --global diff.colorMoved zebra
```

Install [grok](https://github.com/superagent-ai/grok-cli).

```zsh
ln -s ~/cr/Ho/setting/zprofile.sh ~/.zprofile

ln -s ~/cr/Ho/setting/zshrc.sh ~/.zshrc

mkdir -p ~/.config/nvim

ln -s ~/cr/Ho/setting/init.lua ~/.config/nvim

mkdir -p ~/.julia/config

ln -s ~/cr/Ho/setting/startup.jl ~/.julia/config
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

julia --eval "using Pkg: update; update()"

grok --update
```
