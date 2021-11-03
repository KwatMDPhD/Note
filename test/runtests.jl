TE = joinpath(homedir(), "Downloads", "PkgRepository.test", "")

if isdir(TE)

    rm(TE; recursive = true)

end

mkdir(TE)

println("Made ", TE, ".")

using Revise
using BenchmarkTools

using PkgRepository

get_root_path()

get_template_path()

get_git_user_information()

pk = joinpath(TE, "TestPackage")

make(pk)

check(pk)

using TOML
using UUIDs
using Pkg

ro = "/Users/kwat/craft/"

sk_ = ["TemplatePkgRepository.jl", "GSEA.jl", "LeanProject.jl", "CleanCode.jl"]



for (ro, di_, fi_) in walkdir(ro; topdown = false)

    if "Project.toml" in fi_

        if any(occursin(sk, splitdir(ro)[2]) for sk in sk_)

            continue

        end

        println("-"^80)

        println(ro)

        to = joinpath(ro, "Project.toml")

        di = TOML.parsefile(to)

        ke_ = keys(di)

        if !all(re in ke_ for re in re_)

            error(ro, " is missing at least 1 required keys")

        end

        pk = di["name"]

        #run(`export PK="$pk" && jupyter nbconvert --no-prompt --to script runtests.ipynb && julia --project --eval "using Pkg; Pkg.test()`)

        nb = joinpath(ro, "test", "runtests.ipynb")

        run(`jupyter nbconvert --no-prompt --to script $nb`)

        Pkg.activate(ro)

        #Pkg.update()

        Pkg.test()

    end

end

rm(TE; recursive = true)

println("Removed ", TE, ".")
