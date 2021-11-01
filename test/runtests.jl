TE = joinpath(homedir(), "Downloads", "PkgRepository.test", "")

if isdir(TE)

    rm(TE; recursive = true)

end

mkdir(TE)

println("Made ", TE, ".")

using Revise

using PkgRepository

get_root_path()

get_template_path()

get_git_user_information()

pk = joinpath(TE, "TestPackage")

make(pk)

check(pk)

rm(TE; recursive = true)

println("Removed ", TE, ".")
