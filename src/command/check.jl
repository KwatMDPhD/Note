"""
Check `julia package` (`.jl`) structure and update as needed

# Arguments

  - `path`:
"""
@cast function check(path)

    pa = OnePiece.path.make_absolute(path)

    println("Checking $pa")

    OnePiece.path.error_extension(pa, EXTENSION)

    ti = OnePiece.path.remove_extension(pa)

    if ti == OnePiece.path.remove_extension(TEMPLATE)

        println("Skipping")

        return

    end

    re_ = templating.plan_replacement(ti)

    templating.error_missing(TEMPLATE, pa, re_ = re_)

    for (su, id_) in templating.plan_transplant()

        templating.transplant(joinpath(TEMPLATE, su), joinpath(pa, su), "---", id_, re_ = re_)

    end

    ke_va = OnePiece.dict.read(joinpath(pa, "Project.toml"))

    ke_ = [ke for ke in ["name", "uuid", "version", "authors"] if !haskey(ke_va, ke)]

    if !isempty(ke_)

        error("missing $(join(ke_, " "))")

    end

    if ke_va["name"] != ti

        error("name is not $ti")

    end

end
