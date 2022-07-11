"""
Check missing and transplant.

# Arguments

  - `path`:
"""
@cast function format(path)

    pa = OnePiece.path.make_absolute(path)

    ex = splitext(pa)[2]

    te = "$TEMPLAT$ex"

    println("Checking missing")

    mi_ = []

    re_ = _plan_replacement(pa)

    for (ro, di_, fi_) in walkdir(te)

        for na in vcat(di_, fi_)

            na = replace(na, re_...)

            ex = joinpath(replace(ro, te => pa), na)

            if !ispath(ex)

                push!(mi_, ex)

            end

        end

    end

    if !isempty(mi_)

        error("Missing $(join(mi_, " ")).")

    end

    println("Checking transplant")

    lo = "# $("-" ^ 95) #"

    for (su, de, wh_) in
        [(".gitignore", lo, [1, 2]), ("README.md", "---", [2, 1]), ("LICENSE", "", [])]

        pa1 = joinpath(te, su)

        pa2 = joinpath(pa, replace(su, re_...))

        st1 = read(pa1, String)

        st2 = read(pa2, String)

        if isempty(de)

            st = st1

        else

            st = OnePiece.string.transplant(st1, st2, de, wh_)

        end

        st3 = replace(st, re_...)

        if st2 != st3

            println("Transplanting $pa2")

            write(pa2, st3)

        end

    end

end
