using Kata

using BioLab

te = BioLab.Path.make_temporary("Kata.test")

for ex in (".jl", ".pro")

    wh = "What$ex"

    cd(te)

    Kata.make(wh)

    run(`tree -a`)

    cd(wh)

    Kata.format()

    for co in ("update", "run")

        Kata.call(co)

    end

end
