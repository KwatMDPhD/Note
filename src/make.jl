"""
Copy from a template and recursively `rename` and `sed`.

# Arguments

  - `name`:
"""
@cast function make(name)

    #
    pa = joinpath(pwd(), name)

    ex = splitext(pa)[2]

    #
    println("`cp`ing")

    cp("$TE$ex", pa)

    #
    re_ = _plan_replacement(pa)

    #
    println("`rename`ing")

    BioLab.Path.rename_recursively(pa, re_)

    #
    println("`sed`ing")

    BioLab.Path.sed_recursively(pa, re_)

end
