## Name variables

Use two characters and pluralize by suffixing with the number of preceding `_` + 1 `_`s

- "Thing": `th` (pluralize by adding 0 + 1 `_` ➡ `th_`).

Special cases

- "Number of things": `ut` (0 + 1 ➡ `ut_`).

- "Dictionary mapping a key to a value": `ke_va` (1 + 1 ➡ `ke_va__`).

Uppercase global variables.

## Name in context

Name major things (sample, feature, ...) consistently within the global context (module, file, ...)

- "Cat" in a file and "Car" in another: `ca`.

Name common things (index, select, line, minimum, mean, median, maximum, standard deviation, unique, ...) consistently within the local context (function, loop, ...)

- "Index of row" in a location and "Index of column" in another: `id`.

When two variables collide in a context, make the second character the differentiator

- "Thing before" and "Thing after" in a location: `tb` and `ta` (or `t1` and `t2`).

## Name functions

Name functions explicitly

- `do_something()`.

Avoid collisions by removing a character

- `do_somethin()`.

Prefix names not to be exposed with "\_"

- `_do_something_local()`.
