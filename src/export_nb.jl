"""
Export `test/runtests ipynb` to `test/runtests jl` and `README md`

# Arguments

  - `pa`: package path
"""
@cast function export_nb(pa::String)::Nothing

    pa = make_absolute(pa)

    nb = joinpath(pa, "test", "runtests.ipynb")

    println("Exporting ", nb)

    run(`jupyter-nbconvert --no-prompt --to script --log-level 0 $nb`)

    return nothing

end

export export_nb
