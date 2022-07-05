"""
Format based on a template.

# Arguments

  - `path`:
"""
@cast function format(path)

    pa = _ready(path, EXTENSION)

    _template(pa, TEMPLATE, [], [])

    to = joinpath(pa, "Project.toml")

    println("Checking $to")

    ke_va = OnePiece.dict.read(to)

    ke_ = [ke for ke in ["name", "uuid", "version", "authors"] if !haskey(ke_va, ke)]

    if !isempty(ke_)

        error("Missing $(join(ke_, " ")).")

    end

    ti = OnePiece.path.remove_extension(pa)

    if ke_va["name"] != ti

        error("Name is not $ti.")

    end

end
