Terminal / Settings... / Profiles / ... / Import... / `*terminal`

```bash
cd ~/cr/md/Note

ln -s $(pwd)/setting/zshrc.sh ~/.zshrc

mkdir -p ~/.config/nvim

ln -s $(pwd)/setting/init.lua ~/.config/nvim

mkdir -p ~/.julia/config

ln -s $(pwd)/setting/startup.jl ~/.julia/config

ln -s $(pwd)/setting/JuliaFormatter.toml ~/.JuliaFormatter.toml
```

Install [brew](https://brew.sh).

```bash
cd

brew install tree rename neovide luarocks ripgrep node imagemagick exiftool
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

brew upgrade

brew doctor

brew cleanup

npm --global upgrade

julia --eval "using Pkg: update; update()"
```
