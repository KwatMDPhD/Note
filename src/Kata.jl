module Kata

using Comonicon: @cast, @main

using UUIDs: uuid4

using BioLab

const PR = joinpath(dirname(@__DIR__), "TEMPLATE")

function _get_extension(pa)

    ex = BioLab.Path.get_extension(pa)

    if !(ex in ("jl", "pro"))

        error("Extension $ex is not jl or pro.")

    end

    ex

end

function _get_git_config(ke)

    readchomp(`git config user.$ke`)

end

function _plan_replacement(pa)

    "TEMPLATE" => splitext(basename(pa))[1],
    "GIT_USER_NAME" => _get_git_config("name"),
    "GIT_USER_EMAIL" => _get_git_config("email"),
    "033e1703-1880-4940-9ddc-745bff01a2ac" => string(uuid4())

end

function _rename(di, pa_)

    for (be, af) in pa_

        run(pipeline(`find $di -print0`, `xargs -0 rename --subst-all $be $af`))

    end

end

function _sed(di, pa_)

    for (be, af) in pa_

        run(pipeline(`find $di -type f -print0`, `xargs -0 sed -i '' "s/$be/$af/g"`))

    end

end

"""
Copy from the template and recursively rename and sed.

# Arguments

  - `name`:
"""
@cast function make(name)

    pa = cp("$PR.$(_get_extension(name))", joinpath(pwd(), name))

    pa_ = _plan_replacement(name)

    _rename(pa, pa_)

    _sed(pa, pa_)

    nothing

end

function _read_json(di)

    BioLab.Dict.read(joinpath(di, "Kata.json"), Dict{String, Any})

end

function _transplant(st1, st2, de, id_)

    sp1_ = split(st1, de)

    sp2_ = split(st2, de)

    if length(sp1_) != length(sp2_)

        error("Split lengths differ.")

    end

    join((ifelse(isone(id), sp1, sp2) for (id, sp1, sp2) in zip(id_, sp1_, sp2_)), de)

end

"""
Error if any paths are missing, and (if necessary) transplant the default texts from the template files."
"""
@cast function format()

    wo = pwd()

    ex = _get_extension(wo)

    te = "$PR.$ex"

    pa_ = _plan_replacement(basename(wo))

    for (ro, di_, fi_) in walkdir(te)

        for na in vcat(di_, fi_)

            if ex == "pro" && na == "1_make_something_people_want.jl"

                continue

            end

            BioLab.Error.error_missing(joinpath(replace(ro, te => wo), replace(na, pa_...)))

        end

    end

    ke_va = _read_json(wo)

    for ke in ("download", "call")

        if !haskey(ke_va, ke)

            error("Kata.json.$ke is missing.")

        end

    end

    lo = "# ----------------------------------------------------------------------------------------------- #"

    ho_ = [("LICENSE", "", ()), ("README.md", "---", (2, 1)), (".gitignore", lo, (1, 2))]

    if ex == "jl"

        push!(ho_, (joinpath("test", "runtests.jl"), lo, (1, 2)))

    elseif ex == "pro"

        append!(
            ho_,
            (
                (joinpath("code", "environment.jl"), lo, (1, 2)),
                (joinpath("code", "run.jl"), lo, (1, 2, 1)),
            ),
        )

    end

    for (re, de, id_) in ho_

        st1 = replace(read(joinpath(te, re), String), pa_...)

        pa2 = joinpath(wo, re)

        st2 = read(pa2, String)

        if isempty(de)

            st3 = st1

        else

            st3 = _transplant(st1, st2, de, id_)

        end

        if st2 != st3

            @info "Transplanting $pa2"

            write(pa2, st3)

        end

    end

end

"""
Download Kata.json.download.
"""
@cast function download()

    wo = pwd()

    for (re, ur) in _read_json(wo)["download"]

        if isempty(BioLab.Path.get_extension(ur))

            co = "sync"

        else

            co = "cp"

        end

        run(`aws s3 $co $ur $re`)

    end

end

"""
Call Kata.json.call.command.

# Arguments

  - `command`:
"""
@cast function call(command)

    run(`sh -c $(_read_json(pwd())["call"][command])`)

    nothing

end

"""
Command-line program for working with GitHub-, Amazon-S3-backed Julia packages (.jl) and projects (.pro). Learn more at https://github.com/KwatMDPhD/Kata.jl.
"""
@main

end
