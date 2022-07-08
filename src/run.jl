"""
Update, convert `runtests.ipynb` to `jl`, and run `Pkg.test()`.

# Arguments

  - `path`:

# Flags

  - `--skip`:
"""
@cast function run(path; skip::Bool = false)

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

    if skip

        return

    end

    println("Testing")

    Pkg.test()

end
