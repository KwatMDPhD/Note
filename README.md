Command-line program for working with GitHub-, Amazon-S3-backed julia packages (.jl) and projects (.pro).

## Use

### `kata.json`

```json
{
  "download": {
    "data": "https://",
    "input": "https://"
  },
  "call": {
    "update": "julia --project --eval 'using Pkg; Pkg.update()'",
    "run": "julia --project --eval 'using Pkg; Pkg.test()'"
  }
}
```

Commands are the same for `.jl`s and `.pro`s.

Make a `.pro`

```bash
kata make MyProject.pro
```

Enforce `kata` format

```bash
kata format
```

Download `kata.json.download`

```bash
kata download
```

Call `kata.json.call` command

```bash
kata call update
```

```bash
kata call run
```

## Install

```bash
git clone https://github.com/KwatMDPhD/Kata.jl &&

cd Kata.jl &&

julia --project --eval "using Pkg; Pkg.instantiate()" &&

julia --project deps/build.jl
```

☝️ commands install `kata` into `~/.julia/bin`. If not already, add it to the path

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
