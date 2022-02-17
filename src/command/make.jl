"""
Make a `julia package` (`.jl`)

# Arguments

  - `path`:
"""
@cast function make(path)

    pa = OnePiece.path.make_absolute(path)

    println("Making $pa")

    OnePiece.path.error_extension(pa, EXTENSION)

    cp(TEMPLATE, pa)

    sr = joinpath(pa, "src")

    OnePiece.path.move(joinpath(sr, basename(TEMPLATE)), joinpath(sr, basename(pa)))

    OnePiece.path.sed_recursively(
        pa,
        templating.plan_replacement(OnePiece.path.remove_extension(pa)),
    )

end
