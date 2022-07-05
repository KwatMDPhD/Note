TE = joinpath(tempdir(), "TEMPLATE.test")

if isdir(TE)

    rm(TE, recursive = true)

end

mkdir(TE)

#using Revise
using TEMPLATE
