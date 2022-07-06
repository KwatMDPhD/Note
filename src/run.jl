"""
Update, convert `runtests.ipynb` to `jl`, and run `Pkg.test()`.

# Arguments

  - `path`:

# Flags

  - `--skip-run`:
"""
@cast function run(path; skip_run::Bool = false)

    #

    pa = OnePiece.path.make_absolute(path)

    #

    println("Updating")

    Pkg.activate(pa)

    Pkg.instantiate()

    Pkg.update()

    #

    println("Converting `runtests.jl`")

    Base.run(
        `jupyter-nbconvert --log-level 40 --to script $(joinpath(pa, "test", "runtests.ipynb"))`,
    )

    #
    if skip_run

        return

    end

    #

    println("Testing")

    Pkg.test()

end
