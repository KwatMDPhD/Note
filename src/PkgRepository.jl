module PkgRepository

using Comonicon
using TOML
using UUIDs

using PathExtension

include("get_extension.jl")

include("get_template_path.jl")

include("get_replacement.jl")

include("make.jl")

include("enforce.jl")

include("export_nb.jl")

"""
Command-line interface for working with `Julia package repository` (`.jl`) :bento:
"""
@main

end
