"""
Make a package repository.

# Arguments

  - `pk`: package name
"""
@cast function make(pk::String)::String

    println("Making ", pk)

    cp(get_template_path(), pk)

    return pk

end
