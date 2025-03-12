Terminal > Settings... > Profiles > Import `setting/terminal/*`

Terminal > View > Hide Marks

```bash
brew install tree rename ripgrep screen neovide luarocks shfmt node exiftool imagemagick
```

```bash
ln -s $(pwd)/setting/zshrc.sh ~/.zshrc

mkdir -p ~/.config/nvim

ln -s $(pwd)/setting/init.lua ~/.config/nvim

mkdir -p ~/.julia/config

ln -s $(pwd)/setting/startup.jl ~/.julia/config

ln -s $(pwd)/setting/JuliaFormatter.toml ~/.JuliaFormatter.toml
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

git config --global http.postBuffer 524288000

git config --global --list
```

```bash
rm -rf ~/.julia/
```

```julia
using Pkg: add

for pa in ("BenchmarkTools", "Logging", "Revise")

    add(pa)

end
```

```bash
npm install --global http-server prettier prettier-plugin-tailwindcss prettier-plugin-sh @prettier/plugin-lua
```

```bash
brew install pyenv

pyenv install 3.13.0

pyenv global 3.13.0

pip install ipython virtualenv
```

```bash
brew update

brew upgrade

npm --global upgrade

julia --eval "using Pkg; Pkg.update()"
```
