module PkgRepository

using Comonicon

include("get_root_path.jl")

include("get_template_path.jl")

include("make.jl")

include("check_readme_md.jl")

include("check_project_toml.jl")

include("check.jl")

"""
Tools for julia package repository.
"""
@main

end
