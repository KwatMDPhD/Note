Terminal / Settings... / Profiles / ... / Import... / `setting/Tokyo night.terminal`

```bash
cd ~/cr/wr/Note

mkdir -p ~/.config/nvim ~/.julia/config

ln -s $(pwd)/setting/zprofile.sh ~/.zprofile

ln -s $(pwd)/setting/zshrc.sh ~/.zshrc

ln -s $(pwd)/setting/init.lua ~/.config/nvim

ln -s $(pwd)/setting/startup.jl ~/.julia/config

ln -s $(pwd)/setting/JuliaFormatter.toml ~/.JuliaFormatter.toml
```

Install [brew](https://brew.sh).

```bash
cd

brew install ripgrep rename node exiftool

brew install --cask neovide
```

Install [julia](https://julialang.org/install).

```julia
using Pkg: add

for st in ("BenchmarkTools", "Revise")

    add(st)

end
```

```bash
cd

npm install --global prettier prettier-plugin-sh prettier-plugin-toml prettier-plugin-tailwindcss @prettier/plugin-lua
```

```bash
cd

git config --global user.name "KwatMDPhD"

git config --global user.email "kwat.me@icloud.com"

git config --global credential.helper osxkeychain

git config --global fetch.prune true

git config --global pull.rebase true

git config --global diff.colorMoved zebra
```

```bash
cd

brew update

brew upgrade --greedy

brew autoremove

brew cleanup --prune=all

brew doctor

brew leaves

npm --global upgrade

julia --eval "using Pkg: update; update()"
```
