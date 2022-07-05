function _copy_sed(te, pa)

    println("Making $pa")

    cp(te, pa)

    OnePiece.path.sed_recursively(pa, _plan_replacement(OnePiece.path.remove_extension(pa)))

end
