using OnePiece

pr = joinpath(dirname(@__DIR__), "kata.json")

if islink(pr)

    pr = readlink(pr)

end

RO = dirname(pr)

SE = OnePiece.dict.read(pr)

for (ke, va) in SE

    SE[ke] = replace(va, r"^\./" => RO)

end
