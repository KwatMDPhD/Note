https://juliadatascience.io

https://www.juliafordatascience.com/performance-tips

https://docs.julialang.org

https://viralinstruction.com/posts/aoc2021_1

https://viralinstruction.com/posts/optimise

https://viralinstruction.com/posts/badjulia

https://bkamins.github.io/julialang/2021/01/08/typestable.html

https://discourse.julialang.org/t/whats-the-difference-between-fields-and-properties/12495/7

https://jkrumbiegel.com/pages/2020-10-31-tuples-and-vectors

https://modernjuliaworkflows.org

The parser does not see types and separates the code into blocks.

Within each block, like within a function, the compiler infers object types and optimizes code.

Code inside functions run faster than top-level ones.

Use many small functions to have the compiler optimize many simple blocks.

In each block, assess only local objects and arguments (in a function).

Accessing a variable elsewhere results in a closure.
The type-blind parser captures (outer) `variable::AType` into (inner) `variable::Any`.

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

Type declaration is helpful in few cases.

Type empty containers.

Type `struct` fields.
Parameterize a `struct` instead of its fields so that making one stabilizes its fields.
However, making one using an abstract type does not stabilize the fields.
Fully parameterize types.
For example, supply `T` and `N` in `Array{T, N}`.

Allocate less.

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

Avoid splatting (`...`).

Fuse reorderable, element-wise operations and vectorize (same as to broadcast or `dot`).

Unroll (checking the end of a loop less often).

Julia is column-major, objects or their pointers in a column are stored contiguously (in a cache line).
Dimension 1 refers to the column or vertical.
Access a matrix column wise.
The inner-most loop should be of a column.

Use `Set` to check membership in a big container.

Copying scattered indices of an array to a contiguous array and then linearly indexing the copy can be faster.

Make custom `struct`s with data-oriented design.
For example, use `struct` of `Array`s instead of `Array` of `struct`s.
