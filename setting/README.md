## Set Terminal

Settings... > Profiles > Import `terminal/*`

View > Hide Marks

## Install `brew` and other command-line tools

https://brew.sh

```bash
brew install screen tree rename watch macvim fzf ripgrep node yarn shfmt xclip xsel exiftool imagemagick
```

## Set profiles

```bash
cp zshrc ~/.zshrc &&

cp vimrc ~/.vimrc &&

cp screenrc ~/.screenrc
```

## Set `macvim`

```bash
rm -rf ~/.vim/
```

```vim
:PlugInstall
```

MacVim > Settings... > After last window closes: > Quit MacVim

MacVim > Settings... > Resizing window: > Smoothly resizes window > 👍

## Set `git`

```bash
git config --global user.name "KwatMDPhD" &&

git config --global user.email "kwat.me@icloud.com" &&

git config --global credential.helper osxkeychain &&

git config --global fetch.prune true &&

git config --global pull.rebase true &&

git config --global status.submoduleSummary true &&

git config --global diff.submodule log &&

git config --global diff.colorMoved zebra &&

git config --global --list
```

## Install and set `julia`

```bash
rm -rf ~/.julia/
```

https://julialang.org/downloads

```julia
using Pkg: add

for pa in ("BenchmarkTools", "Revise", "TestEnv")

    add(pa)

end
```

```bash
mkdir -p ~/.julia/config &&

cp startup.jl ~/.julia/config
```

```bash
cp JuliaFormatter.toml ~/.JuliaFormatter.toml
```

## Set `node`

```bash
npm install --global prettier prettier-plugin-svelte
```

## (Useful commands)

Check deviation

```bash
diff zshrc ~/.zshrc &&

diff screenrc ~/.screenrc &&

diff vimrc ~/.vimrc &&

diff startup.jl ~/.julia/config/startup.jl &&

diff JuliaFormatter.toml ~/.JuliaFormatter.toml
```

Update

```bash
brew update &&

brew upgrade &&

npm --global upgrade &&

julia --eval "using Pkg; Pkg.update()"
```

```vim
:PlugUpgrade

:PlugUpdate
```
