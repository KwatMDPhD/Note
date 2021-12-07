"""
Check `julia package` (`.jl`) structure and update as needed

# Arguments

  - `pa`: path
"""
@cast function check(pa::String)::Nothing

    pa = PathExtension.make_absolute(pa)

    println("Checking ", pa)

    PathExtension.error_extension(pa, EXTENSION)

    ti = PathExtension.get_file_name_without_extension(pa)

    if ti == PathExtension.get_file_name_without_extension(TEMPLATE)

        return nothing

    end

    #PathExtension.error_missing_path(TEMPLATE, pa)

    re_ = TemplateExtension.get_replacement(ti)

    for (su, id_) in [
        TemplateExtension.get_transplant()
        ("test/runtests.ipynb", [1, 2, 1])
    ]

        TemplateExtension.transplant(
            joinpath(TEMPLATE, su),
            joinpath(pa, su),
            "---",
            id_,
            ti,
        )

    end

    ke_va = TOML.parsefile(joinpath(pa, "Project.toml"))

    ke_ = Vector{String}()

    for ke in ["name", "uuid", "version", "authors", "deps"]

        if !haskey(ke_va, ke)

            push!(ke_, ke)

        end

    end

    if 0 < length(ke_)

        error("missing ", ke_)

    end

    if ke_va["name"] != ti

        error("name is not ", ti)

    end

    return nothing

end
