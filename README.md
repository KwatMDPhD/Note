Command-line program for working with GitHub-, Amazon-S3-backed julia packages (.jl) and projects (.pro).

`.jl` template makes a julia package.

`.pro` template makes a julia project.

## Use

```bash
kata make Luffy.jl

cd Luffy.jl
```

```bash
kata format
```

```bash
kata call run
```

☝️ commands work on `.pro`s too.

## Install

```bash
git clone https://github.com/KwatMDPhD/Kata.jl &&

cd Kata.jl &&

julia --project --eval "using Pkg; Pkg.instantiate()" &&

julia --project deps/build.jl
```

☝️ commands install `kata` into `~/.julia/bin`.

If not already, add the `bin` to the path by adding 👇 to the profile (like `~/.zprofile`) (and restart the shell.)

```bash
PATH=~/.julia/bin:$PATH
```

Test installation

```bash
kata --version
```

🎉

---

Powered by https://github.com/KwatMDPhD/Kata.jl 🌝
