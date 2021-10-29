using PkgRepository: make, check

pk = joinpath(homedir(), "Downloads", "MyPackage")

if isdir(pk)

    rm(pk; recursive = true)

end

make(pk)

check(pk)

rm(pk; recursive = true)
