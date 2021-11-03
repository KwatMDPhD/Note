"""
Export test/runtests ipynb to test/runtests jl and README md

# Arguments

  - `pk`: package path
"""
@cast function export_nb(pk::String)::Nothing

    pk = make_absolute(pk)

    nb = joinpath(pk, "test", "runtests.ipynb")

    println("Exporting ", nb)

    run(`jupyter nbconvert --no-prompt --to script $nb`)

    return nothing

end

export export_nb
