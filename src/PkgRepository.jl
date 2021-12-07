module PkgRepository

using Comonicon
using Pkg
using TOML

using PathExtension
using TemplateExtension

EXTENSION = ".jl"

TEMPLATE = joinpath(dirname(@__DIR__), string("TEMPLATE", EXTENSION))

include("command/make.jl")

include("command/check.jl")

include("command/run.jl")

"""
Command-line interface for working with `Julia package` (`.jl`) :bento:
"""
@main

end
