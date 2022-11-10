function _plan_replacement(pa)

    na, em = (rstrip(read(`git config user.$ke`, String), '\n') for ke in ("name", "email"))

    (
        "TEMPLATE" => splitext(basename(pa))[1],
        "GIT_USER_NAME" => na,
        "GIT_USER_EMAIL" => em,
        "033e1703-1880-4940-9ddc-745bff01a2ac" => uuid4(),
    )

end
