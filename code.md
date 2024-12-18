## Name variables

Name specifically.

Name with two characters and pluralize by suffixing with the number of preceding "\_".

- "Thing": `th` (plural `th_`); if `th` is taken, use the next character: `ti` (`ti_`).

- "Number of things": `ut`.

- Dictionary (key => value): `ke_va` (`ke_va__`).

- Dictionary (key => values): `ke_va_` (`ke_va__`).

Uppercase global variables: `GL` (`GL_`).

Name functions explicitly: `do_something()`.

Avoid collisions by removing a character: `do_somethin()`.

Prefix names not to be exposed with "\_": `_do_something_local()`.

## Name files

Keep original names.

When writing a file

- Table: `feature_x_sample_x_number.tsv`.

- Dictionary: `key_x_value.json`.

- Mark a transformation with an extension: `feature_x_sample_x_number.log.tsv`.

## Think less

Import specifically at the top.

Use `<` and `<=` instead of `>` and `>=`.

Count from one.

Limit subjective integers to 2, 4, or multiples of 8, and limit floats to those whose fractions are multiples of 8: 2, 4, 8, 16, 0.24, 1.032, 2.0048, ...

## Allocate less

Use concrete, immutable data.

Use small data.

Initialize data structures ahead of time.

## Compute less

Be simple.

Be flat.

Be predictable.

Do not change a variable's type.

Store related data close in space.

Access related data close in time.

Handle errors close to their source.

Write small, pure functions, each doing one thing and returning one type.

Avoid accessing global variables within a function.
