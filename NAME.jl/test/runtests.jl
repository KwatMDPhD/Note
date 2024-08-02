using NAME

using Aqua: test_all, test_ambiguities

using Test: @test

test_all(NAME; ambiguities = false, deps_compat = false)

test_ambiguities(NAME)

# ----------------------------------------------------------------------------------------------- #
