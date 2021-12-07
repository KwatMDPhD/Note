"""
Export `test/runtests.ipynb` to `test/runtests.jl` and run `Pkg.test()`

# Arguments

  - `pa`: path

# Flags

  - `--sk`: skip running

"""
@cast function run(pa::String; sk::Bool = false)::Nothing

    pa = PathExtension.make_absolute(pa)

    println("Running ", pa)

    nb = joinpath(pa, "test", "runtests.ipynb")

    Base.run(`jupyter-nbconvert --no-prompt --to script --log-level 0 $nb`)

    Pkg.activate(pa)

    Pkg.update()

    Pkg.instantiate()

    if !sk

        Pkg.test()

    end

    return nothing

end
