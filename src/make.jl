"""
Copy from a template and recursively `rename` and `sed`.

# Arguments

  - `name`:
"""
@cast function make(name)

    pa = joinpath(pwd(), name)

    ex = splitext(pa)[2]

    println("`cp`ing")

    cp("$TEMPLAT$ex", pa)

    re_ = _plan_replacement(pa)

    println("`rename`ing")

    OnePiece.path.rename_recursively(pa, re_)

    println("`sed`ing")

    OnePiece.path.sed_recursively(pa, re_)

end
