TE = joinpath(homedir(), "Downloads", "TemplatePkgRepository.test", "")

if isdir(TE)

    rm(TE; recursive = true)

end

mkdir(TE)

println("Made ", TE, ".")

using Revise
using BenchmarkTools

using TemplatePkgRepository

rm(TE; recursive = true)

println("Removed ", TE, ".")
