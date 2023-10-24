@info "Started on $(readchomp(`date +"%Y-%m-%d %H:%M:%S"`))."

# ----------------------------------------------------------------------------------------------- #

for jl in ("1_make_something_people_want.jl",)

    run(`julia --project $jl`)

end

# ----------------------------------------------------------------------------------------------- #

@info "Ended on $(readchomp(`date +"%Y-%m-%d %H:%M:%S"`))."
