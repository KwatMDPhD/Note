Terminal > Settings... > Profiles > Import `setting/terminal/*`

```bash
ln -s $(pwd)/setting/zshrc.sh ~/.zshrc

ln -s $(pwd)/setting/screenrc ~/.screenrc

mkdir -p ~/.config/nvim

ln -s $(pwd)/setting/init.lua ~/.config/nvim

mkdir -p ~/.julia/config

ln -s $(pwd)/setting/startup.jl ~/.julia/config

ln -s $(pwd)/setting/JuliaFormatter.toml ~/.JuliaFormatter.toml
```

```bash
brew install watch tree rename neovide luarocks ripgrep screen shfmt node yarn exiftool imagemagick
```

```julia
using Pkg: add

for pa in ("BenchmarkTools", "Logging", "Revise")

    add(pa)

end
```

```bash
brew install pyenv

pyenv install --list | grep dev

pyenv install 3.13.3

pyenv global 3.13.3

#pip install ipython virtualenv
```

```bash
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
brew update

brew upgrade

brew doctor

brew cleanup

npm --global upgrade

julia --eval "using Pkg: update; update()"
```
