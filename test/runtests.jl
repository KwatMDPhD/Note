TE = joinpath(tempdir(), "Kata.test")

if isdir(TE)

    rm(TE, recursive = true)

end

mkdir(TE)

#using Revise
using Kata

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

for pa in ["~/craft/OnePiece.jl", "~/craft/GSEA.jl", "~/craft/Kata.jl", "~/craft/Clean.jl"]

    Kata.format(pa)

end

nb_ = [na for na in readdir() if occursin(r".ipynb$", na) && na != "runtests.ipynb"]

if all(startswith.(nb_, r"^[0-9]+\."))

    sort!(nb_, by = nb -> parse(Int64, split(nb, '.')[1]))

end

for (id, nb) in enumerate(nb_)

    if id < 1

        continue

    end

    println("Running ", nb, " (", id, ")")

    run(
        `jupyter-nbconvert --log-level 40 --inplace --execute --ExecutePreprocessor.timeout=-1 --clear-output $nb`,
    )

end
