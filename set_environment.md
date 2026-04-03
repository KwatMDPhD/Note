Do everything in `~`.

Install [brew](https://brew.sh).

```zsh
brew analytics off
```

```zsh
brew install node ripgrep rename exiftool

brew install --cask neovide
```

```zsh
npm --global install prettier prettier-plugin-sh prettier-plugin-toml prettier-plugin-tailwindcss @prettier/plugin-lua md-to-pdf
```

Install [julia](https://julialang.org/install).

```julia
using Pkg: add

add(["BenchmarkTools", "Revise"])
```

```zsh
git config --global user.name "KwatMDPhD"

git config --global user.email "kwat.me@icloud.com"

git config --global credential.helper osxkeychain

git config --global fetch.prune true

git config --global pull.rebase true

git config --global diff.colorMoved zebra
```

Install [grok](https://github.com/superagent-ai/grok-cli).

```zsh
cd ~/cr/Note

ln -s $(pwd)/setting/zprofile.sh ~/.zprofile

rm -rf ~/.zshrc

ln -s $(pwd)/setting/zshrc.sh ~/.zshrc

mkdir -p ~/.config/nvim

ln -s $(pwd)/setting/init.lua ~/.config/nvim

mkdir -p ~/.julia/config

ln -s $(pwd)/setting/startup.jl ~/.julia/config

ln -s $(pwd)/setting/JuliaFormatter.toml ~/.JuliaFormatter.toml
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
