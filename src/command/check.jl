"""
Check `julia package` (`.jl`) structure and update as needed

# Arguments

  - `path`:
"""
@cast function check(path)

    pa = make_absolute(path, EXTENSION)

    check_templating(pa, TEMPLATE, [], [])

    to = joinpath(pa, "Project.toml")

    println("Checking $to")

    ke_va = OnePiece.dict.read(to)

    ke_ = [ke for ke in ["name", "uuid", "version", "authors"] if !haskey(ke_va, ke)]

    if !isempty(ke_)

        error("missing $(join(ke_, " "))")

    end

    ti = OnePiece.path.remove_extension(pa)

    if ke_va["name"] != ti

        error("name is not $ti")

    end

end
