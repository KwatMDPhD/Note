using Aqua: test_all, test_ambiguities

using Test: @test

using Kata

# ---- #

test_all(Kata; ambiguities = false)

test_ambiguities(Kata)

# ---- #

# ----------------------------------------------------------------------------------------------- #

using BioLab

# ---- #

const TE = BioLab.Path.remake_directory(joinpath(BioLab.TE, "Kata"))

# ---- #

@test isconst(Kata, :PR)

# ---- #

@test BioLab.Error.@is Kata._get_extension("Name.not_jl_or_pro")

# ---- #

const EX_ = ("jl", "pro")

for ex in EX_

    @test Kata._get_extension("Name.$ex") == ex

end

# ---- #

@test contains(Kata._get_git_config("email"), '@')

# ---- #

const PR = "Prefix"

for (pa1, pa2) in zip(
    Kata._plan_replacement("$PR.extension1"),
    Kata._plan_replacement("/path/to/$PR.extension2"),
)

    if pa1.first == "033e1703-1880-4940-9ddc-745bff01a2ac"

        @test pa1.second != pa2.second

    else

        if pa1.first == "TEMPLATE"

            @test pa1.second == PR

        end

        @test pa1.second == pa2.second

    end

end

# ---- #

touch(joinpath(TE, "th1"))

touch(joinpath(TE, "th2"))

Kata._rename(TE, ("th" => "new",))

@test BioLab.Path.read(TE) == ["new1", "new2"]

# ---- #

const FI1 = touch(joinpath(TE, "fi1"))

const FI2 = touch(joinpath(TE, "fi2"))

write(FI1, "Before")

write(FI2, "BeforeBefore")

Kata._sed(TE, ("Before" => "After",))

@test readline(FI1) === "After"

@test readline(FI2) === "AfterAfter"

# ---- #

const ST1 = "A--BB--CCC"

const DE = "--"

const ID_ = (1, 2, 1)

@test BioLab.Error.@is Kata._transplant(ST1, "a--bb", DE, ID_)

# ---- #

@test Kata._read_json(dirname(@__DIR__)) == Dict(
    "download" => Dict(),
    "call" => Dict(
        "update" => "julia --project --eval 'using Pkg; Pkg.update()'",
        "run" => "julia --project --eval 'using Pkg; Pkg.test()'",
    ),
)

# ---- #

@test Kata._transplant(ST1, "a--bb--ccc", DE, ID_) === "A--bb--CCC"

# ---- #

# TODO: Use public files.
const RE_UR = Dict(
    "data/test" => "s3://guardiome-data/clinvar",
    "data/test.vcf" => "s3://guardiome-data/snpEff/variants_head_ann.vcf",
)

for ex in EX_

    cd(TE)

    @info "Testing $ex"

    wh = "$PR.$ex"

    if isdir(wh)

        BioLab.Path.remove(wh; recursive = true, force = true)

    end

    Kata.make(wh)

    try

        run(`diff $(joinpath(dirname(@__DIR__), "TEMPLATE.$ex")) $wh`)

    catch

    end

    cd(wh)

    Kata.format()

    @test Kata._read_json(pwd())["download"] == Dict{String, Any}()

    # TODO
    if basename(homedir()) == "kate"

        BioLab.Dict.write(
            "Kata.json",
            merge(BioLab.Dict.read("Kata.json"), Dict("download" => RE_UR)),
        )

        Kata.download()

        for re in keys(RE_UR)

            if isempty(Kata._get_extension(re))

                @test !isempty(BioLab.Path.read(re))

            else

                @test isfile(re)

            end

        end

    end

    for co in ("update", "run")

        Kata.call(co)

    end

end
