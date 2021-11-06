function error_project_toml(pa::String, na::String)::Nothing

    println("Checking Project.toml")

    di = parsefile(joinpath(pa, "Project.toml"))

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

export error_project_toml
