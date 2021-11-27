module PkgRepository

using Comonicon
using TOML
using UUIDs

using PathExtension
using StringExtension

EXTENSION = ".jl"

TEMPLATE = joinpath(dirname(@__DIR__), string("Template", EXTENSION))

GIT_CONFIG = Dict(
    ke => string(rstrip(read(`git config user.$ke`, String), '\n')) for
    ke in ["name", "email"]
)

include("make.jl")

include("check.jl")

include("export_nb.jl")

"""
Command line interface for julia package repository :bento: :octocat:
"""
@main

end
