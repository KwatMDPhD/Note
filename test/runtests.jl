using Test: @test

using BioLab

using Kata

# ---- #

# ----------------------------------------------------------------------------------------------- #

function _reset_dir(di)

    rm(di; force = true, recursive = true)

    mkdir(di)

end

# ---- #

const TE = joinpath(tempdir(), "Kata")

_reset_dir(TE)

# ---- #

const JS = Kata._read_kata_json()

@test JS["call"]["run"] == "julia --project --eval 'using Pkg; Pkg.test()'"

# ---- #

@test Kata._get_extension(@__DIR__) == ".jl"

# ---- #

@test occursin(".com", Kata._get_git_config("email"))

# ---- #

const REJL = Kata._plan_replacement("~/Downloads/TestKata.jl")

const REPR = Kata._plan_replacement("~/Downloads/TestKata.pro")

@test get(Dict(REJL[1]), "TEMPLATE", 0) == get(Dict(REPR[1]), "TEMPLATE", 0) == "TestKata"

# ---- #

_reset_dir(TE)

const TH1 = touch(joinpath(TE, "th1"))

const TH2 = touch(joinpath(TE, "th2"))

Kata._rename(TE, ("th" => "new",))

@test BioLab.Path.read(TE) == ["new1", "new2"]

# ---- #

const FI1 = touch(joinpath(TE, "fi1"))

const FI2 = touch(joinpath(TE, "fi2"))

write(FI1, "Before")

write(FI2, "BeforeBefore")

Kata._sed(TE, ("Before" => "After",))

@test readline(open(FI1)) == "After"

@test readline(open(FI2)) == "AfterAfter"

# ---- #

const ST1 = "A--BB--CCC"

const DE = "--"

const ID_ = (1, 2, 1)

@test BioLab.Error.@is_error Kata._transplant(ST1, "a--bb", DE, ID_)

@test Kata._transplant(ST1, "a--bb--ccc", DE, ID_) == "A--bb--CCC"

# ---- #

_reset_dir(TE)

KA = Dict(
    "download" => [
        "data/test" => "s3://guardiome-data/clinvar",
        "data/test.vcf" => "s3://guardiome-data/snpEff/variants_head_ann.vcf",
    ],
    "call" => [
        "update" => "julia --project --eval 'using Pkg; Pkg.update()'",
        "run" => "julia --project --eval 'using Pkg; Pkg.test()'",
    ],
)

for ex in (".jl", ".pro")

    cd(TE)

    @info ex

    wh = "What$ex"

    Kata.make(wh)

    try

        run(`diff $(joinpath(pkgdir(Kata), "TEMPLATE$ex")) $wh`)

    catch

    end

    cd(wh)

    Kata.format()

    BioLab.Dict.write(joinpath(TE, wh, "Kata.json"), KA)

    Kata.download()

    for (ke, va) in Kata._read_kata_json()["downlaod"]

        if isempty(Kata._get_extension(ke))

            @test !isempty(readdir(ke))

        else

            @test isfile(ke)

        end

    end

    for co in ("update", "run")

        Kata.call(co)

    end

end
