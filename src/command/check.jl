"""
Check `julia package` (`.jl`) structure and update as needed

# Arguments

  - `pa`: path
"""
@cast function check(pa)

    pa = make_absolute(pa)

    println("Checking ", pa)

    error_extension(pa, EXTENSION)

    ti = remove_extension(pa)

    if ti == remove_extension(TEMPLATE)

        println("Skipping")

        return

    end

    re_ = plan_replacement(ti)

    error_missing(TEMPLATE, pa; re_ = re_)

    for (su, id_) in [plan_transplant(); ("test/runtests.ipynb", [1, 2, 1])]

        transplant(joinpath(TEMPLATE, su), joinpath(pa, su), "---", id_, re_ = re_)

    end

    ke_va = read(joinpath(pa, "Project.toml"))

    ke_ = [ke for ke in ["name", "uuid", "version", "authors"] if !haskey(ke_va, ke)]

    if !isempty(ke_)

        error("missing ", ke_)

    end

    if ke_va["name"] != ti

        error("name is not ", ti)

    end

end
