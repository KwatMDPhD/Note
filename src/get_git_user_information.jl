function get_git_user_information()::Vector{String}

    return [
        rstrip(read(`git config user.$ke`, String), '\n') for
        ke in ["name", "email"]
    ]

end

export get_git_user_information
