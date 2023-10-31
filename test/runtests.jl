using Test: @test

using Kata

# ----------------------------------------------------------------------------------------------- #

using Nucleus

# ---- #

const TE = joinpath(tempdir(), "Kata")

# ---- #

Nucleus.Path.remake_directory(TE)

# ---- #

@test Nucleus.Error.@is Kata._get_extension("Name.not_jl_or_pro")

# ---- #

@test contains(Kata._get_git_config("email"), '@')

# ---- #

const PR = "Prefix"

# ---- #

for (beaf1, beaf2) in zip(
    Kata._plan_replacement("$PR.extension1"),
    Kata._plan_replacement("/path/to/$PR.extension2"),
)

    if beaf1.first == "033e1703-1880-4940-9ddc-745bff01a2ac"

        @test beaf1.second != beaf2.second

    else

        if beaf1.first == "TEMPLATE"

            @test beaf1.second === PR

        end

        @test beaf1.second === beaf2.second

    end

end

# ---- #

touch(joinpath(TE, "th1"))

# ---- #

touch(joinpath(TE, "th2"))

# ---- #

Kata._rename(TE, ("th" => "new",))

# ---- #

@test Nucleus.Path.read(TE) == ["new1", "new2"]

# ---- #

const FI1 = touch(joinpath(TE, "fi1"))

# ---- #

const FI2 = touch(joinpath(TE, "fi2"))

# ---- #

write(FI1, "Before")

# ---- #

write(FI2, "BeforeBefore")

# ---- #

Kata._sed(TE, ("Before" => "After",))

# ---- #

@test readline(FI1) === "After"

# ---- #

@test readline(FI2) === "AfterAfter"

# ---- #

@test Kata._read_json(dirname(@__DIR__)) == Dict(
    "download" => Dict(),
    "call" => Dict(
        "update" => "julia --project --eval 'using Pkg; Pkg.update()'",
        "run" => "julia --project --eval 'using Kata; using Aqua: test_all, test_ambiguities; test_all(Kata; ambiguities = false); test_ambiguities(Kata); using Pkg; Pkg.test()'",
    ),
)

# ---- #

const PK = pkgdir(Kata)

# ---- #

const EX = Kata._get_extension(PK)

# ---- #

# 289.083 μs (230 allocations: 17.60 KiB)
#@btime Kata._error_missing(PK, EX, "$(Kata._PR).$EX", $(Kata._plan_replacement(PK)));

# ---- #

const ST1 = "A--BB--CCC"

# ---- #

const DE = "--"

# ---- #

const ID_ = (1, 2, 1)

# ---- #

@test Nucleus.Error.@is Kata._transplant(ST1, "a--bb", DE, ID_)

# ---- #

const ST2 = "a--bb--ccc"

# ---- #

@test Kata._transplant(ST1, ST2, DE, ID_) === "A--bb--CCC"

# ---- #

# 501.083 ns (24 allocations: 1.67 KiB)
#@btime Kata._transplant(ST1, ST2, DE, ID_);

# ---- #

# TODO: Use public files.
const RE_UR = Dict(
    "data/test" => "s3://guardiome-data/clinvar",
    "data/test.vcf" => "s3://guardiome-data/snpEff/variants_head_ann.vcf",
)

# ---- #

for ex in ("jl", "pro")

    cd(TE)

    @info ex

    wh = "$PR.$ex"

    if isdir(wh)

        Nucleus.Path.remove(wh; recursive = true, force = true)

    end

    Kata.make(wh)

    try

        run(`diff $(joinpath(dirname(@__DIR__), "TEMPLATE.$ex")) $wh`)

    catch

    end

    cd(wh)

    Kata.format()

    js = Kata._read_json(pwd())

    @test js["download"] == Dict{String, Any}()

    # TODO: Use public files.
    if basename(homedir()) == "kate"

        Nucleus.Dict.write("Kata.json", merge(js, Dict("download" => RE_UR)))

        Kata.download()

        for re in keys(RE_UR)

            if isempty(Kata._get_extension(re))

                @test !isempty(Nucleus.Path.read(re))

            else

                @test isfile(re)

            end

        end

    end

    Kata.call("update")

    Kata.call("run")

end
