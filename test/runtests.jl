using Test: @test

using Kata

# ---- #

# ----------------------------------------------------------------------------------------------- #

using BioLab

# ---- #

const TERS = BioLab.Path.make_directory(joinpath(BioLab.TE, "Kata_rename_sed"))

# ---- #

touch(joinpath(TERS, "th1"))

touch(joinpath(TERS, "th2"))

Kata._rename(TERS, ("th" => "new",))

@test BioLab.Path.read(TERS) == ["new1", "new2"]

# ---- #

const FI1 = touch(joinpath(TERS, "fi1"))

const FI2 = touch(joinpath(TERS, "fi2"))

write(FI1, "Before")

write(FI2, "BeforeBefore")

Kata._sed(TERS, ("Before" => "After",))

@test readline(FI1) == "After"

@test readline(FI2) == "AfterAfter"

# ---- #

const ST1 = "A--BB--CCC"

const DE = "--"

const ID_ = (1, 2, 1)

@test BioLab.Error.@is_error Kata._transplant(ST1, "a--bb", DE, ID_)

@test Kata._transplant(ST1, "a--bb--ccc", DE, ID_) == "A--bb--CCC"

# ---- #

const BA = "What.extension"

for pa in (joinpath(@__DIR__, BA), BA, joinpath("s3://path/to", BA))

    @test Kata._get_extension(pa) == "extension"

end

# ---- #

@test contains(Kata._get_git_config("email"), '@')

# ---- #

const EX_ = ("jl", "pro")

# ---- #

for ex in EX_

    @test Kata._plan_replacement("/path/to/What.$ex")[1] == ("TEMPLATE" => "What")

end

# ---- #

const TE = BioLab.Path.make_directory(joinpath(BioLab.TE, "Kata"))

# TODO: Use public files.
const RE_UR = Dict(
    "data/test" => "s3://guardiome-data/clinvar",
    "data/test.vcf" => "s3://guardiome-data/snpEff/variants_head_ann.vcf",
)

for ex in EX_

    cd(TE)

    @info ex

    wh = "What.$ex"

    if isdir(wh)

        rm(wh; recursive = true, force = true)

    end

    Kata.make(wh)

    try

        te = joinpath(dirname(@__DIR__), "TEMPLATE.$ex")

        run(`diff $te $wh`)

    catch

    end

    cd(wh)

    Kata.format()

    @test Kata._read_json(pwd())["download"] == Dict()

    if basename(homedir()) == "kate"

        BioLab.Dict.write(
            "Kata.json",
            merge(BioLab.Dict.read("Kata.json"), Dict("download" => RE_UR)),
        )

        Kata.download()

        for re in keys(RE_UR)

            if isempty(Kata._get_extension(re))

                @test !isempty(readdir(re))

            else

                @test isfile(re)

            end

        end

    end

    for co in ("update", "run")

        Kata.call(co)

    end

end
