using Test

using BioLab

using Kata

# ---- #

te = joinpath(tempdir(), "Kata.test")

BioLab.Path.empty(te)

# ---- #

for ex in (".jl", ".pro")

    cd(te)

    BioLab.print_header(ex)

    wh = "What$ex"

    println("make")

    Kata.make(wh)

    # @code_warntype Kata.make(wh)

    try

        run(`diff $(joinpath(pkgdir(Kata), "TEMPLATE$ex")) $wh`)

    catch

    end

    cd(wh)

    println("format")

    Kata.format()

    # @code_warntype Kata.format()

    for co in ("update", "run")

        println("run $co")

        Kata.call(co)

        # @code_warntype Kata.call(co)

    end

end
