println("Building ", dirname(joinpath(@__DIR__)))

using PkgRepository

PkgRepository.comonicon_install()
