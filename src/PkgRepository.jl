module PkgRepository

using Comonicon

include("get_root_path.jl")

include("make.jl")

include("check.jl")

"""
Tools for julia package repository :bento: :octocat:
"""
@main

end
