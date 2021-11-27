"""
Make a julia package repository (for GitHub)

# Arguments

  - `pa`: package path
"""
@cast function make(pa::String)::Nothing

    pa = make_absolute(pa)

    println("Making ", pa)

    error_extension(pa, EXTENSION)

    cp(TEMPLATE, pa)

    sr = joinpath(pa, "src")

    na = splitdir(pa)[2]

    move(joinpath(sr, splitdir(TEMPLATE)[2]), joinpath(sr, na))

    replace_text(
        pa,
        Dict(
            "TEMPLATE" => splitext(na)[1],
            "GIT_USER_NAME" => GIT_CONFIG["name"],
            "GIT_USER_EMAIL" => GIT_CONFIG["email"],
            "033e1703-1880-4940-9ddc-745bff01a2ac" => string(uuid4()),
        ),
    )

    return nothing

end

export make
