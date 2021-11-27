"""
Make a `julia package repository` (`.jl`)

# Arguments

  - `pa`: package path
"""
@cast function make(pa::String)::Nothing

    pa = PathExtension.make_absolute(pa)

    println("Making ", pa)

    PathExtension.error_extension(pa, get_extension())

    te = get_template_path()

    cp(te, pa)

    sr = joinpath(pa, "src")

    jl = splitdir(pa)[2]

    PathExtension.move(joinpath(sr, splitdir(te)[2]), joinpath(sr, jl))

    PathExtension.sed_recursively(pa, get_replacement(splitext(jl)[1]))

    return nothing

end
