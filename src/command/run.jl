"""
Export `test/runtests.ipynb` to `test/runtests.jl` and run `Pkg.test()`

# Arguments

  - `path`:

# Flags

  - `--skip-run`:
"""
@cast function run(path; skip_run::Bool = false)

    pa = OnePiece.path.make_absolute(path)

    println("Running $pa")

    Pkg.activate(pa)

    Pkg.update()

    if !skip_run

        Pkg.test()

    end

end
