module Kata

using Comonicon: @cast, @main

using UUIDs: uuid4

using BioLab

const TE = joinpath(dirname(@__DIR__), "TEMPLATE")

function _get_extension(pa)

    splitext(pa)[2]

end

function _get_git_config(ke)

    readchomp(`git config user.$ke`)

end

function _plan_replacement(pa)

    "TEMPLATE" => splitext(basename(pa))[1],
    "GIT_USER_NAME" => _get_git_config("name"),
    "GIT_USER_EMAIL" => _get_git_config("email"),
    "033e1703-1880-4940-9ddc-745bff01a2ac" => uuid4()

end

"""
Copy from the template and recursively `rename` and `sed`.

# Arguments

  - `name`:
"""
@cast function make(name)

    pa = joinpath(pwd(), name)

    cp("$TE$(_get_extension(pa))", pa)

    re_ = _plan_replacement(pa)

    BioLab.Path.rename_recursively(pa, re_)

    BioLab.Path.sed_recursively(pa, re_)

end

"""
Error if there is any missing path.
And (if necessary) transplant the default texts from the template files.
"""
@cast function format()

    wo = pwd()

    ex = _get_extension(wo)

    te = "$TE$ex"

    re_ = _plan_replacement(wo)

    mi_ = Vector{String}()

    for (ro, di_, fi_) in walkdir(te)

        for na in vcat(di_, fi_)

            ch = joinpath(replace(ro, te => wo), replace(na, re_...))

            if !ispath(ch)

                push!(mi_, ch)

            end

        end

    end

    if !isempty(mi_)

        error(mi_)

    end

    lo = "# $('-' ^ 95) #"

    ho_ = [
        (".gitignore", lo, (1, 2)),
        ("README.md", "---", (2, 1)),
        ("LICENSE", "", ()),
        ("kata.json", "", ()),
    ]

    if ex == ".pro"

        append!(
            ho_,
            [
                (joinpath("code", "environment.jl"), lo, (1, 2)),
                (joinpath("code", "run.jl"), lo, (1, 2, 1)),
            ],
        )

    end

    for (rl, de, id_) in ho_

        st1 = replace(read(joinpath(te, rl), String), re_...)

        pa2 = joinpath(wo, rl)

        st2 = read(pa2, String)

        if de == ""

            st3 = st1

        else

            st3 = BioLab.String.transplant(st1, st2, de, id_)

        end

        if st2 != st3

            println("Transplanting $pa2")

            write(pa2, st3)

        end

    end

end

"""
Call `kata.json` command.

# Arguments

  - `command`:
"""
@cast function call(command)

    wo = pwd()

    run(`sh -c $(BioLab.Dict.read(joinpath(wo, "kata.json"))[command])`)

end

"""
Command-line program for working with GitHub-, Amazon-S3-backed julia packages (.jl) and projects (.pro).
Learn more at https://github.com/KwatMDPhD/Kata.jl.
"""
@main

end
