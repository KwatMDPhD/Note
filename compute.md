##

Install brew.

```zsh
brew analytics off
brew install ripgrep rename shfmt stylua node
brew install --cask neovide
```

##

```zsh
npm --global install prettier prettier-plugin-tailwindcss md-to-pdf
```

##

Install julia.

```julia
using Pkg: add as Pkgadd

using Pkg.Apps: add as Appsadd

Pkgadd("Revise")

Appsadd("JuliaFormatter")

Appsadd("Runic")

#]app dev ~/cr/Help.jl
```

##

Install grok.

##

```zsh
git config --global user.name ''
git config --global user.email ''
git config --global credential.helper osxkeychain
git config --global fetch.prune true
git config --global diff.colorMoved zebra
```

##

```zsh
mkdir -p ~/.config/nvim ~/.julia/config
ln -s ~/cr/Note/setting/zprofile.sh ~/.zprofile
ln -sf ~/cr/Note/setting/zshrc.sh ~/.zshrc
ln -s ~/cr/Note/setting/init.lua ~/.config/nvim
ln -s ~/cr/Note/setting/startup.jl ~/.julia/config
```

##

```zsh
brew update
brew upgrade --greedy
brew autoremove
brew cleanup --prune=all
brew doctor
npm --global install npm@latest
npm --global upgrade
julia --eval 'using Pkg: update; update()'
grok update
```

##

Install Signal, Vimari, Google Drive, and Spotify.
