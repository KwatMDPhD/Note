"""
Make a `julia package` (`.jl`)

# Arguments

  - `pa`: path
"""
@cast function make(pa)

    pa = make_absolute(pa)

    println("Making ", pa)

    error_extension(pa, EXTENSION)

    cp(TEMPLATE, pa)

    sr = joinpath(pa, "src")

    jl = splitdir(pa)[2]

    move(joinpath(sr, splitdir(TEMPLATE)[2]), joinpath(sr, jl))

    ti = remove_extension(pa)

    sed_recursively(pa, plan_replacement(ti))

end
