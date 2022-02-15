# PkgRepository.jl

Command-line interface for working with `Julia package repository` (`.jl`) :bento:

## Use

Make a `julia package` (`.jl`)

```bash
pkgr make path/to/MyPackage.jl
```

### Check `julia package` (`.jl`) structure and update as needed

```bash
pkgr check path/to/MyPackage.jl
```

### Export `test/runtests.ipynb` to `test/runtests.jl` and run `Pkg.test()`

```bash
pkgr run path/to/MyPackage.jl
```

## Install

```bash
git clone https://github.com/KwatMDPhD/PkgRepository.jl &&

cd PkgRepository.jl &&

julia --project --eval "using Pkg; Pkg.instantiate()" &&

julia --project deps/build.jl
```

:point_up: commands install `pkgr` into `~/.julia/bin`.

If not already, add the `bin` to the path by adding :point_down: to the profile (`~/.zshrc`, `~/.rc`, ...)

```bash
PATH=~/.julia/bin:$PATH
```

Start a new shell to load the updated profile.

Test installation

```bash
pkgr -h
```

:tada:

---

## Howdy :wave: :cowboy_hat_face:

To report a bug, request a feature, or leave a comment, just [submit an issue](https://github.com/KwatMDPhD/PkgRepository.jl/issues/new/choose).

---

_Powered by https://github.com/KwatMDPhD/PkgRepository.jl_
