Command-line program for working with GitHub-, Amazon-S3-backed Julia packages (`.jl`) and projects (`.pro`) 🥋

## Install

#### 1. Get AWS Command-Line Interface

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

#### 2. Download

```bash
git clone https://github.com/KwatMDPhD/Kata.jl
```

#### 3. Instantiate

```bash
cd Kata.jl &&

julia --project --eval "using Pkg; Pkg.instantiate()"
```

#### 4. Build

```bash
julia --project deps/build.jl
```

#### 5. Path

```bash
PATH=~/.julia/bin:$PATH
```

#### 6. Use

```bash
kata --help
```

🎊

---

Powered by https://github.com/KwatMDPhD/Kata.jl 🥋
