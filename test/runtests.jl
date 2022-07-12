using Kata
using OnePiece

TE = OnePiece.path.make_temporary("Kata.test")

wh = joinpath(TE, "What")

pa = "$wh.jl"

Kata.make(pa)

run(`tree -a $pa`)

Kata.format(pa)

Kata.call(pa, "update")

Kata.call(pa, "run")

pa = "$wh.pro"

Kata.make(pa)

run(`tree -a $pa`)

Kata.format(pa)

Kata.call(pa, "update")

Kata.call(pa, "run")
