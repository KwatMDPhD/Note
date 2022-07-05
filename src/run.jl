"""
Update, make `runtests.jl`, and run `Pkg.test()`.

# Arguments

  - `path`:

# Flags

  - `--skip-run`:
"""
@cast function run(path; skip_run::Bool = false)

    pa = _ready(path, EXTENSION)

    _pkg_update(pa)

    Base.run(
        `jupyter-nbconvert --log-level 40 --to script $(joinpath(pa, "test", "runtests.ipynb"))`,
    )

    if !skip_run

        println("Running $pa")

        Pkg.test()

    end

end
