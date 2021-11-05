TE = joinpath(homedir(), "Downloads", "PkgRepository.test", "")

if isdir(TE)

    rm(TE; recursive = true)

end

mkdir(TE)

println("Made ", TE, ".")

using Revise
using BenchmarkTools

using PkgRepository

using PathExtension

pk = joinpath(TE, "TestPackage")

try

    make(pk)

catch er

    er

end

pk = string(pk, ".jl")

make(pk)

try

    error_project_toml(pk, "Garp")

catch er

    er

end

error_project_toml(pk, get_file_name_without_extension(pk))

check(pk)

export_nb(pk)

rm(TE; recursive = true)

println("Removed ", TE, ".")
