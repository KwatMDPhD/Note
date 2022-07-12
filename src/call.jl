"""
Call a `Kata.json` command.

# Arguments

  - `path`:
  - `command`:
"""
@cast function call(path, command)

    pa = OnePiece.path.make_absolute(path)

    cd(pa)

    co = OnePiece.dict.read(joinpath(pa, "Kata.json"))[command]

    run(`sh -c $co`)

end
