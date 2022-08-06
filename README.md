# Kata.jl

Command-line program for working with templates :bento:

`.jl` template makes a `julia` package that is lean and uses `.ipynb` for testing and examples.

`.pro` template makes a `julia` package for an informatics project.

## Use

```bash
kata make BigMama.jl
```

```bash
kata format BigMama.jl
```

```bash
kata run BigMama.jl
```

These commands work on also `.pro`s.

## Install

```bash
git clone https://github.com/KwatMDPhD/Kata.jl &&

cd Kata.jl &&

julia --project --eval "using Pkg; Pkg.instantiate()" &&

julia --project deps/build.jl
```

:point_up: commands install `kata` into `~/.julia/bin`.

If not already, add the `bin` to the path by adding :point_down: to the profile (`~/.zshrc`, `~/.rc`, ...)

```bash
PATH=~/.julia/bin:$PATH
```

Start a new shell to load the updated profile.

Test installation

```bash
kata --version
```

:tada:

---

## :wave: :cowboy_hat_face: Howdy

To report a bug, request a feature, or leave a comment, just [submit an issue](https://github.com/KwatMDPhD/Kata.jl/issues/new/choose).

Powered by https://github.com/KwatMDPhD/Kata.jl
