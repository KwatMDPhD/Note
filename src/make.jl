"""
Make a julia package repository (for GitHub)

# Arguments

  - `pk`: package path
"""
@cast function make(pk::String)::Nothing

    pk = make_absolute(pk)

    ex = ".jl"

    if !endswith(pr, ex)

        error("package repository name does not end with ", ex)

    end

    println("Making ", pk)

    cp(get_template_path(), pk)

    na = splitext(splitdir(pk)[2])[1]

    run(`mv $pk/src/TemplatePkgRepository.jl $pk/src/$na.jl`)

    us, em = get_git_user_information()

    for (be, af) in Dict(
        "TemplatePkgRepository" => na,
        "GIT_USER_NAME" => us,
        "GIT_USER_EMAIL" => em,
        "63cd5914-34c6-4c73-bccc-fa14824c6dbc" => uuid4(),
    )

        run(`find $pk -type f -exec sed -i "" "s/$be/$af/g" "{}" +`)

    end

    return nothing

end

export make
