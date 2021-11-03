function read_project_toml(pk::String)::Dict{String, Any}

    return parsefile(joinpath(pk, "Project.toml"))

end

export read_project_toml
