using Test: @test

using Kata

# ----------------------------------------------------------------------------------------------- #

# ---- #

const ST1 = "A--BB--CCC"

const DE = "--"

const ID_ = (1, 2, 1)

@test BioLab.@is_error BioLab.String.transplant(ST1, "a--bb", DE, ID_)

@test BioLab.String.transplant(ST1, "a--bb--ccc", DE, ID_) == "A--bb--CCC"
using BioLab

# ---- #

di = mkdir(joinpath(TE, BioLab.Time.stamp()))

fi1 = touch(joinpath(di, "fi1"))

fi2 = touch(joinpath(di, "fi2"))

Kata.rename(di, ("fi" => "new",))

@test BioLab.Path.read(di) == ["new1", "new2"]

# ---- #

di = mkdir(joinpath(TE, BioLab.Time.stamp()))

fi1 = touch(joinpath(di, "fi1"))

fi2 = touch(joinpath(di, "fi2"))

write(fi1, "Before")

write(fi2, "BeforeBefore")

Kata.sed(di, ("Before" => "After",))

@test readline(open(fi1)) == "After"

@test readline(open(fi2)) == "AfterAfter"

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
