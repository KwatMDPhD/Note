TE = joinpath(tempdir(), "PkgRepository.test", "")

if isdir(TE)

    rm(TE; recursive = true)

end

mkdir(TE)

println("Made ", TE)

using Revise
using BenchmarkTools

using PathExtension

using PkgRepository

pk = joinpath(TE, "APackage")

try

    PkgRepository.make(pk)

catch er

    er

end

pk = string(pk, ".jl")

PkgRepository.make(pk)

PkgRepository.check(pk)

PkgRepository.run(pk)

rm(TE; recursive = true)

println("Removed ", TE)
