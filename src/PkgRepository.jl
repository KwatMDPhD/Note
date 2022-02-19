module PkgRepository

using Comonicon
using OnePiece
using Pkg
using UUIDs

EXTENSION = ".jl"

TEMPLATE = joinpath(dirname(@__DIR__), "TEMPLATE$EXTENSION")

include("templating/make_absolute.jl")

include("templating/plan_replacement.jl")

include("templating/copy_sed.jl")

include("templating/check_templating.jl")

include("templating/pkg_update.jl")

include("command/make.jl")

include("command/check.jl")

include("command/run.jl")

"""
Command-line interface for working with `Julia package` (`.jl`) :bento:
"""
@main

end
