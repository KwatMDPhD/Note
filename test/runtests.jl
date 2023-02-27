using BioLab

using Kata

te = BioLab.Path.make_temporary("Kata.test")

for ex in (".jl", ".pro")

    BioLab.print_header(ex)

    wh = "What$ex"

    cd(te)

    Kata.make(wh)

    # @code_warntype Kata.make(wh)

    run(`tree -a`)

    cd(wh)

    Kata.format()

    # @code_warntype Kata.format()

    for co in ("update", "run")

        Kata.call(co)

        # @code_warntype Kata.call(co)

    end

end
