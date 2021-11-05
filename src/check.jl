"""
Check if a julia package repository has all of the requirements

# Arguments

  - `pa`: package path
"""
@cast function check(pa::String)::Nothing

    pa = make_absolute(pa)

    println("Checking ", pa)

    error_extension(pa, EXTENSION)

    na = get_file_name_without_extension(pa)

    error_missing_path(
        pa,
        [
            ".gitignore",
            "README.md",
            "LICENSE",
            "Project.toml",
            "src",
            joinpath("src", string(na, EXTENSION)),
            "test",
            "test/runtests.ipynb",
            "test/runtests.jl",
        ],
    )

    error_project_toml(pa, na)

    return nothing

end

export check
