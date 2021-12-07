"""
Make a `julia package` (`.jl`)

# Arguments

  - `pa`: path
"""
@cast function make(pa::String)::Nothing

    pa = PathExtension.make_absolute(pa)

    println("Making ", pa)

    PathExtension.error_extension(pa, EXTENSION)

    cp(TEMPLATE, pa)

    sr = joinpath(pa, "src")

    jl = splitdir(pa)[2]

    PathExtension.move(joinpath(sr, splitdir(TEMPLATE)[2]), joinpath(sr, jl))

    ti = PathExtension.get_file_name_without_extension(pa)

    PathExtension.sed_recursively(pa, TemplateExtension.get_replacement(ti))

    return nothing

end
