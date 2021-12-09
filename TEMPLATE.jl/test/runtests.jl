TE = joinpath(tempdir(), "TEMPLATE.test", "")

if isdir(TE)

    rm(TE; recursive = true)

end

mkdir(TE)

println("Made ", TE)

using Revise
using BenchmarkTools

using TEMPLATE

rm(TE; recursive = true)

println("Removed ", TE)
