module Kata

using Comonicon
using OnePiece
using Pkg
using UUIDs

EXTENSION = ".jl"

TEMPLATE = joinpath(dirname(@__DIR__), "TEMPLATE$EXTENSION")

include("_check_templating.jl")

include("_copy_sed.jl")

include("_pkg_update.jl")

include("_plan_replacement.jl")

include("_ready.jl")

include("check.jl")

include("make.jl")

include("run.jl")

"""
Command-line interface for working with `julia package`s (`.jl`) :bento:
"""
@main

end
