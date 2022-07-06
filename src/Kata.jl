module Kata

# ----------------------------------------------------------------------------------------------- #

using Comonicon
using OnePiece
using Pkg
using UUIDs

TEMPLAT = joinpath(dirname(@__DIR__), "TEMPLATE")

include("_plan_replacement.jl")

include("_title.jl")

include("format.jl")

include("make.jl")

include("run.jl")

"""
Command-line interface for working with templates :bento:
"""
@main

# ----------------------------------------------------------------------------------------------- #

end
