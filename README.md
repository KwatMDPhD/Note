Command-line program for working with practical, minimal templates 🍱

`.jl` template makes a `julia` package that uses `.ipynb` for testing and examples.

`.pro` template makes a `julia` package for an informatics project.

## Use

```bash
kata make BigMama.jl

cd BigMama.jl
```

```bash
kata call run
```

```bash
kata format
```

These commands work on also `.pro`s.

## Install

```bash
git clone https://github.com/KwatMDPhD/Kata.jl &&

cd Kata.jl &&

julia --project --eval "using Pkg; Pkg.instantiate()" &&

julia --project deps/build.jl
```

☝️ commands install `kata` into `~/.julia/bin`.

If not already, add the `bin` to the path by adding 👇 to the profile (`~/.zshrc`, `~/.rc`, ...)

```bash
PATH=~/.julia/bin:$PATH
```

Start a new shell to load the updated profile.

Test installation

```bash
kata --version
```

🎉

---

## 👋 🤠 Howdy

To report a bug, request a feature, or leave a comment, just [submit an issue](https://github.com/KwatMDPhD/Kata.jl/issues/new/choose).

Powered by https://github.com/KwatMDPhD/Kata.jl 🌝
