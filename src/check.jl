"""
Check if a package repository has all requirements

# Arguments

  - `pk`: package path
"""
@cast function check(pk::String)::Nothing

    pk = make_absolute(pk)

    println("Cheking ", pk)

    for sp_ in [
        ["README.md"],
        [".gitignore"],
        ["LICENSE"],
        ["Project.toml"],
        ["src", string(read_project_toml(pk)["name"], ".jl")],
        ["test", "runtests.ipynb"],
        ["test", "runtests.jl"],
    ]

        pa = joinpath(pk, sp_...)

        if !isfile(pa)

            error("missing ", pa)

        end

    end

    error_project_toml(pk)

    return nothing

end

export check
