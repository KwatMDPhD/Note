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

    for (su, id_) in [
        [".gitignore", [1, 1, 2]],
        ["README.md", [2, 1, 1]],
        ["LICENSE", []],
        ["test/runtests.ipynb", [1, 2, 1]],
    ]

        println(su)

        pa1 = joinpath(te, su)

        pa2 = joinpath(pa, su)

        st1 = read(pa1, String)

        st2 = read(pa2, String)

        if length(id_) == 0

            st = st1

        else

            st = StringExtension.transplant(st1, st2, "---", id_)

        end

        write(pa2, StringExtension.replace(st, re_))

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
