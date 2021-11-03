TE = joinpath(homedir(), "Downloads", "PkgRepository.test", "")

if isdir(TE)

    rm(TE; recursive = true)

end

mkdir(TE)

println("Made ", TE, ".")

using Revise
using BenchmarkTools

using PkgRepository

get_root_path()

get_template_path()

get_git_user_information()

pk = get_root_path()

read_project_toml(pk)

error_project_toml(pk)

pk = joinpath(TE, "TestPackage")

try

    make(pk)

catch er

    er

end

pk = string(pk, ".jl")

make(pk)

check(pk)

export_nb(pk)

rm(TE; recursive = true)

println("Removed ", TE, ".")
