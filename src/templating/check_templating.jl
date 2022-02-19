function check_templating(pa, te, ig_, tr_)

    println("Checking $pa")

    ti = OnePiece.path.remove_extension(pa)

    if ti == OnePiece.path.remove_extension(te)

        println("Skipping")

        return

    end

    re_ = plan_replacement(ti)

    mi_ = []

    for (ro, di_, fi_) in walkdir(te)

        for na in vcat(di_, fi_)

            if any(occursin.(ig_, joinpath(ro, na)))

                continue

            end

            na = replace(na, re_...)

            pae = joinpath(replace(ro, te => pa), na)

            if !ispath(pae)

                push!(mi_, pae)

            end

        end

    end

    if !isempty(mi_)

        error("missing expected $(join(mi_, " "))")

    end

    for (su, de, id_) in vcat(
        [
            (
                ".gitignore",
                "# ----------------------------------------------------------------------------------------------- #",
                [1, 1, 1, 2],
            ),
            ("README.md", "---", [2, 1, 1]),
            ("LICENSE", "", []),
        ],
        tr_,
    )

        pa1 = joinpath(te, su)

        pa2 = joinpath(pa, su)

        st1 = read(pa1, String)

        st2 = read(pa2, String)

        if isempty(de)

            st = st1

        else

            st = OnePiece.string.transplant(st1, st2, de, id_)

        end

        st3 = replace(st, re_...)

        if st2 != st3

            println("Transplanting $pa2")

            write(pa2, st3)

        end

    end

end
