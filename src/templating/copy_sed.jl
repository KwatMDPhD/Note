function copy_sed(pa, te)

    println("Making $pa")

    cp(te, pa)

    OnePiece.path.sed_recursively(pa, plan_replacement(OnePiece.path.remove_extension(pa)))

end
