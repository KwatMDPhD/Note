using Aqua: test_all, test_ambiguities

using Test: @test

using TEMPLATE

# ---- #

test_all(TEMPLATE; ambiguities = false)

test_ambiguities(TEMPLATE)

# ----------------------------------------------------------------------------------------------- #
