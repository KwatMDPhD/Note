# ----------------------------------------------------------------------------------------------- #
TE = joinpath(tempdir(), "PkgRepository.test")

if isdir(TE)

    rm(TE, recursive = true)

    println("Removed $TE.")

end

mkdir(TE)

println("Made $TE.")

# ----------------------------------------------------------------------------------------------- #
using PkgRepository

# ----------------------------------------------------------------------------------------------- #
pk = joinpath(TE, "APackage")

try

    PkgRepository.make(pk)

catch er

    println(er)

end

pk = "$pk$(PkgRepository.EXTENSION)"

PkgRepository.make(pk)

PkgRepository.check(pk)

PkgRepository.run(pk)

# ----------------------------------------------------------------------------------------------- #
if isdir(TE)

    rm(TE, recursive = true)

    println("Removed $TE.")

end
