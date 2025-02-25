## Think less

Import specifically at the top.

Use `<` and `<=` instead of `>` and `>=`.

Limit integers to 0, 1, 2, 4, or multiples of 8; for floats, apply this rule to their fraction component.

Use specialized functions instead of implementing.

Index with integers instead of booleans.

If there are 2 or more lines in a conditional block, use `continue` style

```julia
# Do this
if !condition
    continue
end
Line 1
Line 2

# instead of this
if condition
    Line 1
    Line 2
end
```

Add `.0` to only the last value: `[1, 2, 3.0]`.

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

Write small, pure functions, each doing one thing and returning one type.

Avoid accessing global variables within a function.

## Test

1 function, 1 loop.

Name any result `re`.

Prefer `===`.

Keep `@btime` close.
