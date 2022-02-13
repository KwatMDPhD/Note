module PkgRepository

using Comonicon
using Pkg

using OnePiece.extension.dict: read
using OnePiece.extension.path:
    error_extension, make_absolute, move, remove_extension, sed_recursively
using OnePiece.templating: error_missing, plan_replacement, plan_transplant, transplant

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
