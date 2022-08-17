module Kata

using Comonicon
using OnePiece
using Pkg
using UUIDs

TEMPLAT = joinpath(dirname(@__DIR__), "TEMPLAT") * "E"

include("_include_neighbor.jl")

_include_neighbor(@__FILE__)

"""
Command-line interface for working with templates :bento:
"""
@main

end
