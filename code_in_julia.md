https://juliadatascience.io (Skip the part about plotting.)

https://juliaci.github.io/BenchmarkTools.jl/stable

https://www.juliafordatascience.com/performance-tips

https://docs.julialang.org

https://docs.julialang.org/en/v1/manual/performance-tips

https://viralinstruction.com/posts/aoc2021_1

https://viralinstruction.com/posts/optimise

https://viralinstruction.com/posts/badjulia

https://bkamins.github.io/julialang/2021/01/08/typestable.html

https://discourse.julialang.org/t/whats-the-difference-between-fields-and-properties/12495/7

https://jkrumbiegel.com/pages/2020-10-31-tuples-and-vectors

## TODO

The parser does not see types and separates the code into blocks.

Within each block, like within a function, the compiler infers object types and optimizes code.
Code inside functions run faster than top-level ones.

Use many small functions to have the compiler optimize many simple blocks.

## TODO

In each block, assess only local objects and arguments (in a function).

Accessing a variable elsewhere results in a closure.
The type-blind parser captures (outer) `variable::AType` into (inner) `variable::Any`.

## TODO

Even without specified types, the compiler infers types on the go.
Knowing the types, the compiler dispatches functions for them and compiles parts of code just before running it.
This is called just-in-time (JIT) compiling.

The compiler sees hard-coded literals, concrete types, and objects of `Type`, `Function`, and `Vararg`, and infers the types of all other objects.

Make functions type stable.
Only by knowing all argument types of a type-stable function, the compiler can infer the return type (even for `convert`).

Make functions take abstract types so that they accept various objects.
As long as their arguments are concrete during compile-time, the compiler optimizes them.

Do not change types to ensure that the compiler knows everything before run-time.
When encountering a type set at run-time or a value of a heterogeneous collection, the compiler looks up the type at run-time, searches for the appropriate method in method tables, decides via type intersection which one matches, determines whether it has been just-in-time (JIT) compiled yet, do so if not, and then makes the call.

## TODO

Type declaration is helpful in few cases.

Type empty container.

Type `struct` fields.
Parameterize a `struct` instead of its fields so that making one stabilizes its fields.
However, making one using an abstract type does not stabilize the fields.
Fully parameterize types.
For example, supply `T` and `N` in `Array{T, N}`.

## Allocate less.

Make everything immutable.
Use concrete, immutable objects.

Avoid global variables.
(If unavoidable) make global variables constant `const GL::AConcreteType` or `const GL = AConcreteType(object)`.

Use `Generator` instead of making a collection.

Use a `Tuple` (or `StaticArray`) instead of an `Array` for small immutable objects.

Avoid containers with abstract type parameters.
For example, `Real[]` stores pointers but `Float64[]` stores a contiguous block of 8-byte data.

Preallocate.

Use in-place (`!`) functions (which have side effects), which also preserve an input type.

Use `Array`s to store only homogeneous values.

Avoid `...`.

## Compute less.

Use `SubString` instead of making a new `String`.

Use `view` instead of `[:]` which makes a new slice.

## Compute smart.

Fuse reorderable, element-wise operations and vectorize (same as to broadcast or `dot`).

Unroll (checking the end of a loop less often).

Julia is column-major, objects or their pointers in a column are stored contiguously (in a cache line).
Dimension 1 refers to the column or vertical.
Access a matrix column wise.
The inner-most loop should be of a column.

## Use tricks.

Use `Set` to check membership in a big container.

Copying scattered indices of an array to a contiguous array and then linearly indexing the copy can be faster.

Make custom `struct`s with data-oriented design.
For example, use `struct` of `Array`s instead of `Array` of `struct`s.

Use `string(x, " ", y)` instead of `"$x $y"` when writing a file.

## Be consistent.

Use `;` before keyword arguments.

`Using Module: function`

Do not omit zeros in floats.

Use `error` instead of `@assert`.

## Use the most specific function.

Use `count_ones`, which directly calls CPU instruction `popcnt`.

Use `div(x, y)` instead of `trunc(x / y)`.

Use `fld(x, y)` instead of `floor(x / y)`.

Use `cld(x, y)` instead of `ceil(x / y)`.

Use `tuple` instead of `Tuple`.

Use `eachindex(x)` instead of `1:length(x)`.

Use `convert(T, other)` instead of `T(other)`.

## Use styles that can be found-and-replaced.

Use `[vh]cat` instead of `...` and `[;]`.

Use `isempty(an)` instead of `an == ""`, `an == []`, and other `an == `s.

## Analyze types.

Use `@code_warntype`.

Use `@code_native`.

Use `@code_lowered`.

Use `Profile.jl`.

Use `PProf.jl`.
https://www.youtube.com/watch?v=BFvpwC8hEWQ

## Benchmark

`@allocated`

Use `BenchmarkTools` `@benchmark` to profile.

`@benchmark` is evaluated in global scope, even if called from local scope.

An evaluation is a single execution of a benchmark expression.
A sample is a single time or memory measurement obtained by running multiple evaluations.
A trial is an experiment in which multiple samples are gathered.

Any interpolated variable `$va` or expression `$(...)` is "pre-computed" before a trial begins.
Interpolate global variables (`@benchmark function($globalvariable)`) to have the compiler optimize the code.

If a trial takes less than 1 ns, the compiler probably simplified away code.

When using randomness, seed it so that randomness is consistent between evaluations.

## Optimize.

Use `@inline` on a small function to insert its code into its parent block so that the compiler sees both blocks together to remove the function's overheads, avoid making a `Tuple` to store the function's arguments, and potentially simplify operations.

Use `@simd`.

Use `@fastmath` to simplify and speed up `Float64` operations.

## TODO

typeof

supertypes

subtypes

methodswith

@show

@macroexpand

Meta.@dump

## TODO

fieldnames

Base.show(io::IO, my::MyStruct)

## TODO

contains

startswith

endswith

string

parse

## TODO

joinpath

`@__FILE__`

pkgdir

## TODO

zeros(T, si\_)

ones(T, si\_)

`Vector{T}(undef, n), Matrix{T}(undef, n_ro, n_co), fill!`

reshape

eltype

size

ndims

CategoricalArrays.categorical(, compress=true)

## TODO

eachindex

first

last

eachcol

eachrow (be careful of types)

## TODO

haskey(ke_va, "a_key")

pop!

## TODO

vcat

hcat

## TODO

map(fu, co), fu.(co)

reduce(fu, an\_)

## TODO

a = ...; b = ...; (; a, b)

## TODO

se = seed!(); rand(se, ); ; rand(se, )

## TODO

Make a column homogeneous.

Use functions from `DataFrames.jl` as much.

da[!, :co]

innerjoin

outerjoin

leftjoin

rightjoin

semijoin (left in right)

antijoin (left not in right)

crossjoin (A1, A2, B1, B2, ...)

## TODO

filter

filter(co => fu, da) (This function does not take `DataFrame` as the first argument because it was meant to be a method of `Base.filter` function.)

subset (This is like `missing`-safe `filter`.)

subset(da, co => fu.(co); skipmissing = true)
subset(da, co => ByRow(fu))

## TODO

select

`:` means "all other columns".

select(da, 1, :co2, "co3", :)

select(da, "co4", Not(:co5))

select(da, co1 => "Column 1", "co2" => "Column 2")

transform(da, co => ByRow(fu) => co2)

transform(da, co => ByRow(fu), renamecols=false)

## TODO

gr_da = groupby(da, :cog)

fu(co) =

combine(gr_da, [:cof1, :cof2] .=> fu, renamecols=false)

## TODO

CSV.write(pa, da)

Ty(CSV.File(pa)) (copies every column...; use functions as much)

CSV.read(pa, Ty) (does not copy and uses multithreading!)

sh_da = readxlsx(pa)
