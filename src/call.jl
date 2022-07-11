"""
Call a `Kata.json` command.

# Arguments

  - `path`:
  - `command`:
"""
@cast function call(path, command)

    pa = OnePiece.path.make_absolute(path)

    cd(pa)

    run(`$(OnePiece.dict.read(joinpath(pa, "Kata.json"))[command])`)

end
