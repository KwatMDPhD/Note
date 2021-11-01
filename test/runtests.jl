using PkgRepository

get_root_path()

get_template_path()

get_git_user_information()

pk = joinpath(homedir(), "Downloads", "TestPackage")

if isdir(pk)

    rm(pk; recursive = true)

end

make(pk)

check(pk)

rm(pk; recursive = true)
