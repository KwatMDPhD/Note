Initially, stay broad and make things work.
Later, get deeper and spend as much time as needed for a complete understanding.
Aim for perfection, but _ship as often as possible_ because shipping is the **best** and may be the **only** way to grow.

## Everywhere

Be less.

Be consistent.

Add things when you actually need them.

Trim and refactor periodically to increase the development speed.

Put an empty line between every line.

Do not put any empty line in an HTML.

Count from one (1, 2, ...).

Use `<` and `<=` instead of `>` and `>=`.

Prefix names not meant to be exposed or used with `_`.

## Module

Put at top of file.

Put public packages first, then private.

Get only what you use.

```
using Satistics: mean

using BioLab
```

## Function

Write small, pure functions - do one thing and return ~one thing.

Minimize depth `f1(f2(f3))`.

Omit `return`.

Avoid passing dictionaries as arguments (array or matrix is better).

Name explicitly

`get_signal_to_noise_ratio(n1_, n2_)`.

## Variable

Order variables like characters in the story of the file.

Keep type constant.

Name with two characters and pluralize by suffixing it with (the number of preceding + 1) `_`

- "Thing": `th` (`th_`), `ti` (`ti_`) `tn` (`tn_`), and `tg` (`tg_`).

- "Number of thing": `n_th` (`n_th__`).

- Dictionary (key => value): `ke_va` (`ke_va__`).

- Dictionary (key => values): `ke_va_` (`ke_va____`).

"Information": `ir` (can not use `in`, `if`, and `io` because they collide with reserved variables).

## Global Variable

Set with `const` and uppercase

`const YE = 2023`.

Avoid them in functions or loops.

## Path

Make at the top level.

Use `mkdir` instead of `mkpath`.

## String

Add period when idea is complete.

## Error

Check error close to the source or the top level.

## File

Name a table

- `feature_x_sample_x_number.tsv`.

Extend an existing name

- `DefaultName.tsv`: `DefaultName.log.tsv`.

# [Hardware](hardware.md)

## CPU

Initialize objects ahead of time.

Be simple, flat, and predictable.

Compute less.

## Cache

Use smaller data.

Store related data close in space.

Access related data close in time.

## Heap

Allocate less.

Use concrete, immutable data.
