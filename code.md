## Think less

Import specifically at the top.

Use `<` and `<=` instead of `>` and `>=`.

Limit subjective integers to 2, 4, or multiples of 8, and limit floats to those whose fractions are multiples of 8: 2, 4, 8, 16, 0.24, 1.032, 2.0048, ...

If there are 2 or more lines in a conditional block, use `continue` style.

```julia
# Bad
if condition
    Line 1
    Line 2
end

# Good
if !condition
    continue
end
Line 1
Line 2
...
```

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
