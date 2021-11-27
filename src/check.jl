function error_project_toml(pa::String, na::String)::Nothing

    println("Checking Project.toml")

    di = TOML.parsefile(joinpath(pa, "Project.toml"))

    ke_ = keys(di)

    mi_ = Vector{String}()

    for re in ["name", "uuid", "version", "authors", "deps"]

        if !(re in ke_)

            push!(mi_, re)

        end

    end

    if 0 < length(mi_)

        error("missing ", mi_)

    end

    if di["name"] != na

        error("name is not ", na)

    end

    return nothing

end

function separate(pa::String, pa2::String, de::String)Tuple{String, String}

    te = read(joinpath(pa, pa2), String)

    if de == ""

        return "", te

    else

        id = findfirst(de, te)[1]

        return te[1:(id - 1)], te[id:end]

    end

end

"""
Check if a julia package repository has all of the requirements

# Arguments

  - `pa`: package path
"""
@cast function check(pa::String)::Nothing

    pa = make_absolute(pa)

    println("Checking ", pa)

    error_extension(pa, EXTENSION)

    na = splitdir(pa)[2]

    error_missing_path(
        pa,
        [
            ".gitignore",
            "README.md",
            "LICENSE",
            "Project.toml",
            "src",
            joinpath("src", na),
            "test",
            "test/runtests.ipynb",
            "test/runtests.jl",
        ],
    )

    ti = splitext(na)[1]

    error_project_toml(pa, ti)

    pa_ = ["TEMPLATE" => ti, "GIT_USER_NAME" => GIT_CONFIG["name"]]

    for (pa2, de) in [
        ["README.md", "---"],
        [".gitignore", string("# ", "="^78)],
        ["LICENSE", ""],
    ]

        pr1 = separate(pa, pa2, de)[1]

        println(pr1)

        su2 = separate(TEMPLATE, pa2, de)[2]

        write(joinpath(pa, pa2), StringExtension.replace(string(pr1, su2), pa_))

    end

    return nothing

end

export check
