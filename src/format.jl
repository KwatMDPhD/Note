"""
Check missing and (if necessary) transplant.
"""
@cast function format()

    #
    wo = pwd()

    ex = splitext(wo)[2]

    te = "$TE$ex"

    #
    re_ = _plan_replacement(wo)

    #
    println("Checking missing")

    mi_ = []

    for (ro, di_, fi_) in walkdir(te)

        for na in vcat(di_, fi_)

            if na == "1.do_something.ipynb"

                continue

            end

            ch = joinpath(replace(ro, te => wo), replace(na, re_...))

            if !ispath(ch)

                push!(mi_, ch)

            end

        end

    end

    #
    if !isempty(mi_)

        error("Missing $(join(mi_, " ")).")

    end

    #
    println("Checking transplant")

    lo = "# $("-" ^ 95) #"

    for (su, de, id_) in
        ((".gitignore", lo, (1, 2)), ("README.md", "---", (2, 1)), ("LICENSE", "", ()))

        #
        pa1 = joinpath(te, su)

        pa2 = joinpath(wo, replace(su, re_...))

        #
        st1 = read(pa1, String)

        st2 = read(pa2, String)

        #
        if isempty(de)

            st = st1

        else

            st = BioLab.String.transplant(st1, st2, de, id_)

        end

        #
        st3 = replace(st, re_...)

        if st2 != st3

            println("Transplanting $pa2")

            write(pa2, st3)

        end

    end

end
