"""
Make from a template.

# Arguments

  - `path`:
"""
@cast function make(path)

    #

    pa = OnePiece.path.make_absolute(path)

    ex = splitext(pa)[2]

    te = "$TEMPLAT$ex"

    #

    println("Copying")

    cp(te, pa)

    #

    println("`sed`ing")

    ti = _title(pa)

    OnePiece.path.sed_recursively(pa, _plan_replacement(ti))

    #

    println("Renaming src/Title.jl")

    sr = joinpath(pa, "src")

    OnePiece.path.move(joinpath(sr, "TEMPLATE.jl"), joinpath(sr, "$ti.jl"))

end
