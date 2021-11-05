module PkgRepository

using Comonicon: @cast, @main
using TOML: parsefile
using UUIDs: uuid4

using PathExtension:
    error_extension,
    error_missing_path,
    get_file_name_without_extension,
    make_absolute,
    move,
    replace_text

EXTENSION = ".jl"

#
include("error_project_toml.jl")

#
include("make.jl")

include("check.jl")

include("export_nb.jl")

"""
Command line interface for julia package repository :bento: :octocat:
"""
@main

end
