function pkg_update(pa)

    println("Updating $pa")

    Pkg.activate(pa)

    Pkg.update()

end
