module TEMPLATE

# ----------------------------------------------------------------------------------------------- #

using OnePiece

se = joinpath(dirname(@__DIR__), "input", "setting.json")

if islink(se)

    se = readlink(se)

end

PAR = dirname(dirname(se))

PAI, PAO = joinpath(PAR, "input"), joinpath(PAR, "output")

SE = OnePiece.dict.read(se)

re = r"^\./"

di = dirname(se)

for (ke, va) in SE

    if va isa String && occursin(re, va)

        SE[ke] = replace(va, re => di)

    end

end

# ----------------------------------------------------------------------------------------------- #

end
