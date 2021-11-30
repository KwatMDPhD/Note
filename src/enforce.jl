"""
Enforce `julia package repository` (`.jl`) structure

# Arguments

  - `pa`: package path
"""
@cast function enforce(pa::String)::Nothing

    pa = PathExtension.make_absolute(pa)

    println("Enforcing ", pa)

    PathExtension.error_extension(pa, get_extension())

    jl = splitdir(pa)[2]

    PathExtension.error_missing_path(
        pa,
        [
            ".gitignore",
            "README.md",
            "LICENSE",
            "Project.toml",
            "src",
            joinpath("src", jl),
            "test",
            "test/runtests.ipynb",
            "test/runtests.jl",
        ],
    )

    te = get_template_path()

    ti = splitext(jl)[1]

    if ti == "TEMPLATE"

        return nothing

    end

    re_ = get_replacement(ti)

    for (su, de) in
        [[".gitignore", string("# ", "="^78)], ["README.md", "---"], ["LICENSE", ""]]

        PathExtension.merge(joinpath(pa, su), joinpath(te, su), de, re_)

    end

    ke_va = TOML.parsefile(joinpath(pa, "Project.toml"))

    ke_ = keys(ke_va)

    mi_ = Vector{String}()

    for re in ["name", "uuid", "version", "authors", "deps"]

        if !(re in ke_)

            push!(mi_, re)

        end

    end

    if 0 < length(mi_)

        error("missing ", mi_)

    end

    if ke_va["name"] != ti

        error("name is not ", ti)

    end

    return nothing

end
