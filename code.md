##

Understand every expression.

Be consistent.

Order everything like a story.

Trim continuously; when in doubt, delete.

## Name

Name variables with two characters and pluralize by suffixing with _the number of preceding "\_" + 1_ "\_"

- "Thing": `th` (plural `th_`); if `th` is taken, use the next character: `ti` (`ti_`).

- "Number of things": `ut`.

- Dictionary (key => value): `ke_va` (`ke_va__`).

- Dictionary (key => values): `ke_va_` (`ke_va__`).

Uppercase global variables: `GL` (`GL_`).

Name functions explicitly; `get_signal_to_noise_ratio(n1_, n2_)`.

Prefix names not to be exposed with "\_".

When getting a file, keep its original name.

When writing a file

- Name tables like `feature_x_sample_x_number.tsv`.

- Name dictionary like `key_x_value.json`.

- Add extension to mark a transformation like `feature_x_sample_x_number.log.tsv`.

## Practice

Import, at the top, only what is used in the file.

Count from one: 1, 2, ...

Use `<` and `<=` instead of `>` and `>=`.

Allocate less.

Use concrete, immutable data.

Use small data.

Initialize data structures ahead of time.

Compute less.

Be simple.

Be flat.

Minimize nesting like `f1(f2(f3))`.

Be predictable.

Do not change a variable's type.

Write small, pure functions, each doing one thing and returning one type.

Avoid accessing global variables within a function.

Store related data close in space.

Access related data close in time.

Handle errors close to their source.

## Write

Instead of creating a nested path, create intermediate directories sequentially.
