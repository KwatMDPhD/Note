using OnePiece

ka = joinpath(dirname(@__DIR__), "Kata.json")

if islink(ka)

    ka = readlink(ka)

end

RO = dirname(ka)

KA = OnePiece.dict.read(ka)

for (ke, va) in KA

    KA[ke] = replace(va, r"^\./" => RO)

end

# ----------------------------------------------------------------------------------------------- #
