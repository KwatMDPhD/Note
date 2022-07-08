using Kata
using OnePiece

TE = OnePiece.path.make_temporary("Kata.test")

wh = joinpath(TE, "What")

jl = "$wh.jl"

Kata.make(jl)

run(`tree -a $jl`)

Kata.format(jl)

Kata.run(jl)

pr = "$wh.pro"

Kata.make(pr)

run(`tree -a $pr`)

Kata.format(pr)

Kata.run(pr)
