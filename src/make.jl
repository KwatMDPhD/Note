using UUIDs: uuid4

"""
Make a package repository.

# Arguments

  - `pk`: package name
"""
@cast function make(pk::String)::String

    println("Making ", pk)

    te = get_template_path()

    run(`cp -r $te $pk`)

    na = splitdir(pk)[2]

    run(`mv $pk/src/TemplatePkgRepository.jl $pk/src/$na.jl`)

    us, em = get_git_user_information()

    for (be, af) in Dict(
        "TemplatePkgRepository" => na,
        "GIT_USER_NAME" => us,
        "GIT_USER_EMAIL" => em,
        "UUID" => uuid4(),
    )

        run(`find $pk -type f -exec sed -i "" "s/$be/$af/g" "{}" +`)

    end

    return pk

end

export make
