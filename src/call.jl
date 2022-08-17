"""
Call a `Kata.json` command.

# Arguments

  - `command`:
"""
@cast function call(command)

    pa = pwd()

    cd(pa)

    co = OnePiece.dict.read(joinpath(pa, "Kata.json"))[command]

    run(`sh -c $co`)

end
