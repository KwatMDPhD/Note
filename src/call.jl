"""
Call a `Kata.json` command.

# Arguments

  - `command`:
"""
@cast function call(command)

    wo = pwd()

    cd(wo)

    run(`sh -c $(BioinformaticsCore.Dict.read(joinpath(wo, "Kata.json"))[command])`)

end
