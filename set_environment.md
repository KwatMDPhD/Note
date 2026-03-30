Do everything in `~`.

Install [brew](https://brew.sh).

```zsh
brew analytics off
```

```zsh
brew install node oven-sh/bun/bun ripgrep rename exiftool

brew install --cask neovide
```

```zsh
bun --global install prettier prettier-plugin-sh prettier-plugin-toml prettier-plugin-tailwindcss @prettier/plugin-lua md-to-pdf grok-dev
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

Terminal / Settings... / Profiles / ... / Import... / `setting/Tokyo night.terminal`

```zsh
cd ~/cr/Note

mkdir -p ~/.config/nvim ~/.julia/config

ln -s $(pwd)/setting/zprofile.sh ~/.zprofile

ln -s $(pwd)/setting/zshrc.sh ~/.zshrc

ln -s $(pwd)/setting/init.lua ~/.config/nvim

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

npm --global upgrade

bun upgrade

bun --global update

julia --eval "using Pkg: update; update()"

grok --update
```
