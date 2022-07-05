TE = joinpath(tempdir(), "Kata.test")

if isdir(TE)

    rm(TE, recursive = true)

end

mkdir(TE)

using Kata

pk = joinpath(TE, "APackage")

try

    Kata.make(pk)

catch er

    println(er)

end

pk = "$pk$(Kata.EXTENSION)"

Kata.make(pk)

Kata.check(pk)

for sk in [true, false]

    Kata.run(pk, skip_run = sk)

end
