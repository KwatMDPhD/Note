function get_template_path()::String

    return joinpath(dirname(@__DIR__), string("Template", get_extension()))

end
