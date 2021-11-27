TE = joinpath(homedir(), "Downloads", "PkgRepository.test", "")

if isdir(TE)

    rm(TE; recursive = true)

end

mkdir(TE)

println("Made ", TE, ".")

using Revise
using BenchmarkTools

using PathExtension

using PkgRepository

pk = joinpath(TE, "TestPackage")

try

    PkgRepository.make(pk)

catch er

    er

end

pk = string(pk, ".jl")

PkgRepository.make(pk)

PkgRepository.enforce(pk)

PkgRepository.export_nb(pk)

rm(TE; recursive = true)

println("Removed ", TE, ".")
