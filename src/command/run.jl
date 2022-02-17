"""
Run `Pkg.test()`

# Arguments

  - `path`:

# Flags

  - `--skip-run`:
"""
@cast function run(path; skip_run::Bool = false)

    pa = make_absolute(path, EXTENSION)

    pkg_update(pa)

    println("Running $pa")

    if !skip_run

        Pkg.test()

    end

end
