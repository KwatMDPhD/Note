"""
Check a package repository.

# Arguments

  - `pk`: package name
"""
@cast function check(pk::String)::Nothing

    println("Cheking ", pk)

    ex = joinpath(get_root_path(), "diff_exclude")

    te = get_template_path()

    for li in
        readlines(ignorestatus(`diff --recursive --exclude-from $ex $te $pk`))

        if any(startswith(li, st) for st in ["Only in ", "diff "])

            println()

            println("="^80)

        end

        println(li)

    end

    return nothing

end
