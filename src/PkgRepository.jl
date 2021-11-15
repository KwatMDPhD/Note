module PkgRepository

using Comonicon
using TOML
using UUIDs

using PathExtension

EXTENSION = ".jl"

#
include("error_project_toml.jl")

#
include("make.jl")

include("check.jl")

include("export_nb.jl")

"""
Command line interface for julia package repository :bento: :octocat:
"""
@main

end
