---
publish: 2023.05.08
edit: ""
title: How to Organize Your Computer
cover: /media/cover.jpg
tag:
  - How-To
  - Coding
  - Bioinformatics
---

## Work

Use only `~/Desktop` and `~/Downloads`.

Use `Stickies`.

## Write

End an idea with a period.

## Name

Start with a verb.

Name things consistently for reading (or for coding https://github.com/KwatMDPhD/Coding.how)

- `2023.04.13 Drill Single-Leg Takedown.mp4`

- `2023.04.13.mp4`

## Save

Documents (medical, legal, ...) ➡️ `iCloud`.

Media ➡️ `~/Record` ➡️ Hard Drive.

`~/craft` ➡️ GitHub.

Tasks ➡️ `Reminders`.

## `~/Record/`

Delete as many files.
(As necessary, edit related videos into one.)

Name files manually like either

- "year.month.day.extension" (`2023.03.28.mp4`) or
- "year.month.day Verb.extension" (`2023.03.28 Go to Hot Springs.mp4`).

`rename-with-date` name files that do not have the above naming format using creation date

- "year.month.day_hour.minute.second.extension-timezone" (`2023.03.28_11.29.47-0800.jpeg`).

```bash
rename-with-date file.(jpeg|jpg|heic|mov|mp4)
```

```bash
for file in *; do rename-with-date $file; done
```

Name folders manually.

Organize the files in `Record/`.

```
Record/

    Event/ 👶 Life events.

        2023.03.30_18.34.22-06.00.mov 💭 Event.

        2023.03.29 Dine with the Family.mp4 💭 Event.

        2023.03.28 Go to Hot Springs/ 💭 Event, which has parts.

            2023.03.28 Visit Astoria Hot Springs.mp4

            2023.03.28 Ayala Buys a Desk and a Chair.mp4

            2023.03.28_11.29.47.jpeg

            2023.03.28_11.29.48.jpeg

        2022.09.12-19 Pass PhD Qualification Exam/ 💭 Event, which has parts over days.

            2022.09.12_19.21.01.jpeg

            2022.09.13_10.52.35.jpeg

            2022.09.14_20.36.25.jpeg

            2022.09.15_20.17.29.jpeg

            2022.09.19_00.25.35.jpeg

            2022.09.19_16.54.00-07.00.mov

    Exercise/ 💪 Life project that increases health.

        2023.03.28.mp4 📈

        2023.03.27.mp4 📈

    Jiu-Jitsu/ 💰 Life project that increases health and wealth.

        2023.03.28.mp4 📈🎁

        2023.03.27.mp4 📈🎁

    KwatMDPhD/ 💰 Life project that increases wealth.

        2021.06.25 Pulmonary Embolism to Obstructive Shock.mp4 🎁
```

Back up `Record/` often.

Scroll through time and enjoy the records.
