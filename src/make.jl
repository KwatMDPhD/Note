"""
Make a package repository.
"""
@cast function make(pk::String)::String

    println("Making :bento: :octocat: ", pk)

    cp(joinpath(get_root_path(), "TemplatePkgRepository.jl", ""), pk)

    return pk

end
