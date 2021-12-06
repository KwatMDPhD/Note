# PkgRepository.jl

Command-line interface for working with `Julia package repository` (`.jl`) :bento:

## Use

### Make a `julia package repository` (`.jl`)

```sh
pkgr make path/to/MyPackage.jl
```

### Enforce `julia package repository` (`.jl`) structure

```sh
pkgr enforce path/to/MyPackage.jl
```

### Export `test/runtests.ipynb` to `test/runtests.jl`

```sh
pkgr export-nb path/to/MyPackage.jl
```

## Install

```sh
git clone https://github.com/KwatMDPhD/PkgRepository.jl &&

cd PkgRepository.jl &&

julia --project --eval "using Pkg; Pkg.instantiate()" &&

julia --project deps/build.jl
```

:point_up: commands install `pkgr` into `~/.julia/bin`.

If not already, add the `bin` to the path by adding :point_down: to the profile (`~/.zshrc`, `~/.bashrc`, ...)

```sh
PATH=~/.julia/bin:$PATH
```

Start a new shell to load the updated profile.

Test installation

```sh
pkgr -h
```

:tada:

---

## Howdy :wave: :cowboy_hat_face:

To report a bug, request a feature, or leave a comment, just [submit an issue](https://github.com/KwatMDPhD/PkgRepository.jl/issues/new/choose).

_Powered by https://github.com/KwatMDPhD/PkgRepository.jl_
