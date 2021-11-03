using TOML: parsefile

function error_project_toml(pk::String)::Nothing

    to = parsefile(joinpath(pk, "Project.toml"))

    ke_ = keys(to)

    for re in ["name", "uuid", "version", "authors", "deps"]

        if !(re in ke_)

            error(to, " is missing ", re)

        end

    end

    return nothing

end

export error_project_toml
