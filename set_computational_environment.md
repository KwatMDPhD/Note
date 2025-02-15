## Terminal

Settings... > Profiles > Import `setting/terminal/*`

View > Hide Marks

## Install `brew` and other command-line tools

https://brew.sh

```bash
brew install screen tree rename watch macvim fzf ripgrep node yarn shfmt xclip xsel exiftool imagemagick
```

## Profiles

```bash
cp setting/zshrc ~/.zshrc

cp setting/vimrc ~/.vimrc
```

## `macvim`

```bash
rm -rf ~/.vim/
```

```vim
:PlugInstall
```

MacVim > Settings... > After last window closes: > Quit MacVim

MacVim > Settings... > Resizing window: > Smoothly resizes window > 👍

## `git`

```bash
git config --global user.name "KwatMDPhD"

git config --global user.email "kwat.me@icloud.com"

git config --global credential.helper osxkeychain

git config --global fetch.prune true

git config --global pull.rebase true

git config --global status.submoduleSummary true

git config --global diff.submodule log

git config --global diff.colorMoved zebra

git config --global http.postBuffer 524288000

git config --global --list
```

## `julia`

```bash
rm -rf ~/.julia/
```

https://julialang.org/downloads

```julia
using Pkg: add

for pa in ("BenchmarkTools", "Revise")

    add(pa)

end
```

```bash
mkdir -p ~/.julia/config

cp setting/startup.jl ~/.julia/config
```

```bash
cp setting/JuliaFormatter.toml ~/.JuliaFormatter.toml
```

## `node`

```bash
npm install --global http-server prettier prettier-plugin-toml prettier-plugin-tailwindcss prettier-plugin-sh
```

## `python`

```bash
brew install pyenv

pyenv install 3.13.0

pyenv global 3.13.0

pip install ipython virtualenv
```

## (Useful commands)

```bash
git diff setting/zshrc ~/.zshrc

git diff setting/vimrc ~/.vimrc

git diff setting/startup.jl ~/.julia/config/startup.jl

git diff setting/JuliaFormatter.toml ~/.JuliaFormatter.toml
```

```bash
brew update

brew upgrade

npm --global upgrade

julia --eval "using Pkg; Pkg.update()"
```

```vim
:PlugUpgrade

:PlugUpdate
```
