using Test

using Aqua

using Kata

# ---- #

Aqua.test_all(Kata; ambiguities = false)

Aqua.test_ambiguities(Kata)

# ----------------------------------------------------------------------------------------------- #

using BioLab

# ---- #

te = joinpath(tempdir(), "Kata.test")

BioLab.Path.reset(te)

# ---- #

for ex in (".jl", ".pro")

    cd(te)

    BioLab.print_header(ex)

    wh = "What$ex"

    println("make")

    Kata.make(wh)

    try

        run(`diff $(joinpath(pkgdir(Kata), "TEMPLATE$ex")) $wh`)

    catch

    end

    cd(wh)

    println("format")

    Kata.format()

    for co in ("update", "run")

        println("run $co")

        Kata.call(co)

    end

end
