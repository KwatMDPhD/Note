module Kata

using Comonicon: @cast, @main

using UUIDs: uuid4

using BioLab

TE = joinpath(dirname(@__DIR__), "TEMPLATE")

function _plan_replacement(pa)

    na, em = (rstrip(read(`git config user.$ke`, String)) for ke in ("name", "email"))

    return (
        "TEMPLATE" => splitext(basename(pa))[1],
        "GIT_USER_NAME" => na,
        "GIT_USER_EMAIL" => em,
        "033e1703-1880-4940-9ddc-745bff01a2ac" => uuid4(),
    )

end

"""
👯‍♀️ Copy from a template and recursively `rename` and `sed`.

# Arguments

  - `name`:
"""
@cast function make(name)

    pa = joinpath(pwd(), name)

    ex = splitext(pa)[2]

    println("🪞 `cp`ing")

    cp("$TE$ex", pa)

    pa_ = _plan_replacement(pa)

    println("📛 `rename`ing")

    BioLab.Path.rename_recursively(pa, pa_)

    println("📝 `sed`ing")

    BioLab.Path.sed_recursively(pa, pa_)

    return nothing

end

"""
🕵️  Check missing and (if necessary) transplant.
"""
@cast function format()

    wo = pwd()

    ex = splitext(wo)[2]

    te = "$TE$ex"

    pa_ = _plan_replacement(wo)

    println("🕵️  Checking missing")

    mi_ = Vector{String}()

    for (ro, di_, fi_) in walkdir(te)

        for na in vcat(di_, fi_)

            if na in ("Manifest.toml", "1.do_something.jl")

                continue

            end

            ch = joinpath(replace(ro, te => wo), replace(na, pa_...))

            if !ispath(ch)

                push!(mi_, ch)

            end

        end

    end

    if !isempty(mi_)

        error("🫥 Missing $(join(mi_, ' ')).")

    end

    println("🔬 Checking transplant")

    lo = "# $('-' ^ 95) #"

    ho_ = [(".gitignore", lo, (1, 2)), ("README.md", "---", (2, 1)), ("LICENSE", "", ())]

    if ex == ".pro"

        push!(ho_, (joinpath("code", "_.jl"), lo, (1, 2)))

    end

    for (fi, de, id_) in ho_

        pa1 = joinpath(te, fi)

        pa2 = joinpath(wo, replace(fi, pa_...))

        st1 = read(pa1, String)

        st2 = read(pa2, String)

        if isempty(de)

            st = st1

        else

            st = BioLab.String.transplant(st1, st2, de, id_)

        end

        st3 = replace(st, pa_...)

        if st2 != st3

            println("🍢 Transplanting $pa2")

            write(pa2, st3)

        end

    end

    return nothing

end

"""
☎️   Call a `Kata.json` command.

# Arguments

  - `command`:
"""
@cast function call(command)

    wo = pwd()

    cd(wo)

    run(`sh -c $(BioLab.Dict.read(joinpath(wo, "Kata.json"))[command])`)

    return nothing

end

"""
🍱 Command-line program for working with practical, minimal templates. 📍 Learn more at https://github.com/KwatMDPhD/Kata.jl.
"""
@main

end
