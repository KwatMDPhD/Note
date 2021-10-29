"""
Check a package repository.

# Arguments

  - `pk`: package name
"""
@cast function check(pk::String)::Nothing

    println("Cheking ", pk)

    te = get_template_path()

    for li in readlines(ignorestatus(`diff --recursive $te $pk`))

        if any(startswith(li, st) for st in ["Only in ", "diff "])

            println()

            println("="^80)

        end

        println(li)

    end

    return nothing

end
