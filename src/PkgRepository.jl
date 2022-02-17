module PkgRepository

using Comonicon

using OnePiece

using Pkg

include("templating/_.jl")

EXTENSION = ".jl"

TEMPLATE = joinpath(dirname(@__DIR__), "TEMPLATE$EXTENSION")

include("command/make.jl")

include("command/check.jl")

include("command/run.jl")

"""
Command-line interface for working with `Julia package` (`.jl`) :bento:
"""
@main

end
