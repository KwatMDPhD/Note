using TOML: parsefile

function error_project_toml(pk::String)::Nothing

    ke_ = keys(read_project_toml(pk))

    for re in ["name", "uuid", "version", "authors", "deps"]

        if !(re in ke_)

            error(pk, " Project.toml is missing ", re)

        end

    end

    return nothing

end

export error_project_toml
