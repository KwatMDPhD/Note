# PkgRepository.jl

Command line interface for julia package repository :bento: :octocat:

## Use

### Make a julia package repository (for GitHub)

```sh
pkgr make path/to/MyPackage.jl
```

### Check if a julia package repository has all of the requirements

```sh
pkgr check path/to/MyPackage.jl
```

### Export `test/runtests.ipynb` to `test/runtests.jl` and `README.md`

```sh
pkgr export-nb path/to/MyPackage.jl
```

## Install

```sh
git clone https://github.com/KwatMDPhD/PkgRepository.jl &&

cd PkgRepository.jl &&

julia --project deps/build.jl
```

:point_up: commands install `pkgr` into `~/.julia/bin`.

If not already, add this `bin` to the path by adding :point_down: to the profile (`~/.zshrc`, `~/.bashrc`, ...):

```sh
PATH=~/.julia/bin:$PATH
```

Start a new shell to load the updated profile.

Test installation:

```sh
pkgr -h
```

:tada:

## Shoutout

[Roger-luo](https://github.com/Roger-luo) made [Comonicon.jl](https://github.com/comonicon/Comonicon.jl), which powers the installation process of this project :raised_hands:

## Howdy :wave: :cowboy_hat_face:

To report a bug, request a feature, or leave a comment (about anything related to this project), just [submit an issue](https://github.com/KwatMDPhD/PkgRepository.jl/issues/new/choose).

---

Made by https://github.com/KwatMDPhD/PkgRepository.jl
