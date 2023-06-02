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

    println("download")

    Kata.download()

    for (ke, va) in Kata._read_kata_json()["download"]

        if isempty(Kata._get_extension(ke))

            @test !isempty(readdir(ke))

        else

            @test isfile(ke)

        end

    end

    # @code_warntype Kata.format()

    for co in ("update", "run")

        println("run $co")

        Kata.call(co)

    end

end
