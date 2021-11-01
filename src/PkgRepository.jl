module PkgRepository

using Comonicon

include("get_root_path.jl")

include("get_template_path.jl")

include("get_git_user_information.jl")

include("make.jl")

include("check.jl")

"""
Commands for julia package repository.
"""
@main

end
