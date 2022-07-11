module Kata

using Comonicon
using OnePiece
using Pkg
using UUIDs

TEMPLAT = joinpath(dirname(@__DIR__), "TEMPLAT") * "E"

include("_plan_replacement.jl")

include("call.jl")

include("format.jl")

include("make.jl")

"""
Command-line interface for working with templates :bento:
"""
@main

end
