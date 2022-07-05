module Kata

using Comonicon
using OnePiece
using Pkg
using UUIDs

EXTENSION = ".jl"

TEMPLATE = joinpath(dirname(@__DIR__), "TEMPLATE$EXTENSION")

include("_copy_sed.jl")

include("_pkg_update.jl")

include("_plan_replacement.jl")

include("_ready.jl")

include("_template.jl")

include("format.jl")

include("make.jl")

include("run.jl")

"""
Command-line interface for working with templates :bento:
"""
@main

end
