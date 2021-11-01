function get_template_path()::String

    return joinpath(get_root_path(), "TemplatePkgRepository.jl", "")

end

export get_template_path
