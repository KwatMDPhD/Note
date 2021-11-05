"""
Make a julia package repository (for GitHub)

# Arguments

  - `pa`: package path
"""
@cast function make(pa::String)::Nothing

    pa = make_absolute(pa)

    println("Making ", pa)

    error_extension(pa, EXTENSION)

    te = string("Template", EXTENSION)

    cp(joinpath(dirname(@__DIR__), te, ""), pa)

    na = get_file_name_without_extension(pa)

    move(joinpath(pa, "src", te), joinpath(pa, "src", string(na, EXTENSION)))

    us, em = (
        string(rstrip(read(`git config user.$ke`, String), '\n')) for
        ke in ("name", "email")
    )

    replace_text(
        pa,
        Dict(
            "TEMPLATE" => na,
            "GIT_USER_NAME" => us,
            "GIT_USER_EMAIL" => em,
            "033e1703-1880-4940-9ddc-745bff01a2ac" => string(uuid4()),
        ),
    )

    return nothing

end

export make
