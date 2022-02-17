# ----------------------------------------------------------------------------------------------- #
TE = joinpath(tempdir(), "PkgRepository.test")

if isdir(TE)

    rm(TE, recursive = true)

    println("Removed $TE.")

end

mkdir(TE)

println("Made $TE.")

# ----------------------------------------------------------------------------------------------- #
run(`julia --project $(joinpath(@__DIR__, "templating.jl"))`)

# ----------------------------------------------------------------------------------------------- #
using PkgRepository

# ----------------------------------------------------------------------------------------------- #
pk = joinpath(TE, "APackage")

try

    PkgRepository.make(pk)

catch er

    println(er)

end

pk = "$pk.jl"

PkgRepository.make(pk)

PkgRepository.check(pk)

PkgRepository.run(pk)

# ----------------------------------------------------------------------------------------------- #
if isdir(TE)

    rm(TE, recursive = true)

    println("Removed $TE.")

end
