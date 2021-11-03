module PkgRepository

using Comonicon

#
include("get_root_path.jl")

include("get_template_path.jl")

include("get_git_user_information.jl")


#
include("make_absolute.jl")

#
include("read_project_toml.jl")

include("error_project_toml.jl")

#
include("make.jl")

include("check.jl")

include("export_nb.jl")

"""
Command line interface to manage julia package repository.
"""
@main

end
