using Kata

using Aqua: test_all, test_ambiguities

using Test: @test

test_all(Kata; ambiguities = false, deps_compat = false)

test_ambiguities(Kata)

# ----------------------------------------------------------------------------------------------- #

using Pkg: activate, status, test

# ---- #

cd(tempdir())

# ---- #

const NA = "PackageName.jl"

# ---- #

if isdir(NA)

    rm(NA; recursive = true)

end

# ---- #

Kata.make(NA)

# ---- #

cd(NA)

# ---- #

Kata.format()

# ---- #

activate(joinpath(tempdir(), NA))

# ---- #

status()

# ---- #

test()
