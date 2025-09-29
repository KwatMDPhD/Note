Terminal > Settings... > Profiles > Import `setting/terminal/*`

```bash
cd ~/cr/we/Note

ln -s $(pwd)/setting/zshrc.sh ~/.zshrc

ln -s $(pwd)/setting/screenrc ~/.screenrc

mkdir -p ~/.config/nvim

ln -s $(pwd)/setting/init.lua ~/.config/nvim

mkdir -p ~/.julia/config

ln -s $(pwd)/setting/startup.jl ~/.julia/config

ln -s $(pwd)/setting/JuliaFormatter.toml ~/.JuliaFormatter.toml
```

Install [brew](https://brew.sh).

```bash
cd

brew install watch tree rename neovide luarocks ripgrep screen shfmt node yarn exiftool imagemagick
```

Install [julia](https://julialang.org/install).

```julia
using Pkg: add

for pa in ("BenchmarkTools", "Revise")

    add(pa)

end
```

```bash
cd

brew install pyenv-virtualenv

pyenv install 3.13.7

pyenv global 3.13.7
```

```bash
pyenv virtualenv 3.13.7 1

cd Project

pyenv local 1
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

git config --global status.submoduleSummary true

git config --global diff.submodule log

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
