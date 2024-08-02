module Kata

using Comonicon: @cast, @main

using UUIDs: uuid4

const _TE = pkgdir(@__MODULE__, "NAME.jl")

function _plan_replacement(na)

    return "NAME" => na[1:(end - 3)],
    "e8386f20-3e60-497e-8358-52c6451f91c7" => string(uuid4()),
    "AUTHOR" => readchomp(`git config user.name`)

end

"""
Make a new package.

# Arguments

  - `name`: PackageName.jl.
"""
@cast function make(name)

    ma = cp(_TE, joinpath(pwd(), name))

    for (be, af) in _plan_replacement(name)

        run(pipeline(`find $ma -print0`, `xargs -0 rename --subst-all $be $af`))

        run(pipeline(`find $ma -type f -print0`, `xargs -0 perl -pi -e "s/$be/$af/g"`))

    end

end

"""
Error if any paths are missing and reset the default texts.
"""
@cast function format()

    ma = pwd()

    nc = lastindex(_TE)

    re_ = _plan_replacement(basename(ma))

    for (ro, di_, fi_) in walkdir(_TE)

        mr = joinpath(ma, ro[(nc + 2):end])

        for na_ in (fi_, di_), na in na_

            mp = joinpath(mr, replace(na, re_...))

            if !ispath(mp)

                error("Missing $mp.")

            end

        end

    end

    for pa in (".JuliaFormatter.toml",)

        r1 = read(joinpath(_TE, pa))

        p2 = joinpath(ma, pa)

        r2 = read(p2)

        if r1 != r2

            @info "Resetting $p2"

            write(p2, r1)

        end

    end

    for (pa, de, rs_) in (
        ("README.md", "---", [false, true]),
        (
            ".gitignore",
            "# ----------------------------------------------------------------------------------------------- #",
            [true, false],
        ),
        (
            joinpath("test", "runtests.jl"),
            "# ----------------------------------------------------------------------------------------------- #",
            [true, false],
        ),
    )

        r1_ = split(replace(read(joinpath(_TE, pa), String), re_...), de)

        p2 = joinpath(ma, pa)

        r2_ = split(read(p2, String), de)

        if lastindex(r1_) != lastindex(r2_)

            error("Split lengths differ.")

        end

        map!(ifelse, r1_, rs_, r1_, r2_)

        if r1_ != r2_

            @info "Transplanting $p2"

            write(p2, join(r1_, de))

        end

    end

end

"""
Command-line program for templating.
"""
@main

end
