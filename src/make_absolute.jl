function make_absolute(pa::String)::String

    return abspath(expanduser(pa))

end

export make_absolute
