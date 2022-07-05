"""
Make from a template.

# Arguments

  - `path`:
"""
@cast function make(path)

    pa = _ready(path, EXTENSION)

    _copy_sed(TEMPLATE, pa)

    sr = joinpath(pa, "src")

    OnePiece.path.move(joinpath(sr, basename(TEMPLATE)), joinpath(sr, basename(pa)))

end
