module Kata

using Comonicon: @cast, @main

using UUIDs: uuid4

using BioLab

include("_include.jl")

@_include()

"""
Command-line program for working with practical, minimal templates 🍱
"""
@main

end
