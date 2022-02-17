# ----------------------------------------------------------------------------------------------- #
TE = joinpath(tempdir(), "templating.test")

if isdir(TE)

    rm(TE, recursive = true)

    println("Removed $TE.")

end

mkdir(TE)

println("Made $TE.")

# ----------------------------------------------------------------------------------------------- #
using PkgRepository

# ----------------------------------------------------------------------------------------------- #
te = joinpath(dirname(@__DIR__), "TEMPLATE.jl")

di = joinpath(dirname(dirname(@__DIR__)), "OnePiece.jl")

try

    PkgRepository.templating.error_missing(te, di)

catch er

    println(er)

end

PkgRepository.templating.error_missing(te, di, re_ = ["TEMPLATE.jl" => "OnePiece.jl"])

te = dirname(@__DIR__)

try

    PkgRepository.templating.error_missing(te, di, ig_ = [r"\.git"])

catch er

    println(er)

end

PkgRepository.templating.error_missing(
    te,
    di,
    ig_ = [r"\.git", r"src", r"TEMPLATE\.jl", r"templating.jl", r"Comonicon\.toml", r"deps"],
)

# ----------------------------------------------------------------------------------------------- #
PkgRepository.templating.plan_transplant()

PkgRepository.templating.plan_replacement("Big Mom")

# ----------------------------------------------------------------------------------------------- #
te = joinpath(TE, "template_file")

write(
    te,
    "# TEMPLATE
--
GIT_USER_NAME
GIT_USER_EMAIL
033e1703-1880-4940-9ddc-745bff01a2ac
--
(stuff)
--
ODA IS GENIUS.",
)

println(read(te, String))

fi = joinpath(TE, "file")

write(
    fi,
    "(bad part)
--
(bad part)
--
GOOD STUFF
--
(bad part)",
)

println(read(fi, String))

PkgRepository.templating.transplant(
    te,
    fi,
    "--",
    [1, 1, 2, 1],
    re_ = PkgRepository.templating.plan_replacement("Katakuri"),
)

println(read(fi, String))

# ----------------------------------------------------------------------------------------------- #
if isdir(TE)

    rm(TE, recursive = true)

    println("Removed $TE.")

end
