"""
Make a `julia package` (`.jl`)

# Arguments

  - `path`:
"""
@cast function make(path)

    pa = make_absolute(path, EXTENSION)

    copy_sed(pa, TEMPLATE)

    sr = joinpath(pa, "src")

    OnePiece.path.move(joinpath(sr, basename(TEMPLATE)), joinpath(sr, basename(pa)))

end
