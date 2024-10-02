## General

Understand every expression.

Be perfect.

Be consistent.

Trim continuously; when in doubt, delete.

Ship continuously.

## Naming Variables

Name variables with two characters and pluralize them by suffixing with _the number of preceding "\_" + 1_ "\_"

- "Thing": `th` (plural `th_`); if `th` is taken, use the next character: `ti` (`ti_`).

- "Number of things": `ut`.

- Dictionary (key => value): `ke_va` (`ke_va__`).

- Dictionary (key => values): `ke_va_` (`ke_va__`).

Name functions explicitly; `get_signal_to_noise_ratio(n1_, n2_)`.

Prefix names not to be exposed with "\_".

Uppercase global variables: `GL` (`GL_`).

## Naming Files

- Table: `feature_x_sample_x_number.tsv`.

Extend a name

- `OriginalName.tsv`: `OriginalName.log.tsv`.

## Importing

Import, at the top, only what is used in the file.

## Variables

Order variables like a story.

Do not change a variable's type.

## Functions

Write small, pure functions, each doing one thing and returning one type.

Avoid accessing global variables within a function.

Minimize nesting like `f1(f2(f3))`.

## Practice

Count from one: 1, 2, ...

Use `<` and `<=` instead of `>` and `>=`.

Use basic data structures.

Handle errors close to their source.

Instead of creating a nested path, create intermediate directories sequentially.

## CPU

Compute less.

Be simple, flat, and predictable.

## Cache

Use smaller data.

Store related data close in space.

Access related data close in time.

## Heap

Initialize objects ahead of time.

Allocate less.

Use concrete, immutable data.

## Terminal

Op == Alt

### Move

Freely = Op + Click

Word left = Op + Left

Word right = Op + Right

Start = Ct + A

End = Ct + E

### Delete

Line = Ct + U

End = Ct + K

Word left = Ct + W

Word right =

### Copy

Select = Op + Select

Without background = Ct + Sh + Cm + C

Plain text = Op + Sh + Cm + C

### Path

Select = Sh + Cm + Double click

Open = Cm + Double click

### Open

Inspector = Cm + I

Characters = Ct + Cm + Sp

### Close

Window with tabs = Sh + Cm + W

Other tabs = Op + Cm + W

## Vi

https://vim.rtorr.com

## Regex

https://stackoverflow.com/questions/22937618/reference-what-does-this-regex-mean/22944075#22944075

## TODO

https://viralinstruction.com/posts/hardware

## Disk

It stores data, which persists when the computer powers off.

Reading from it has a latency of 250 us (5,000,000 cycles).

#### Disk buffer

It is a small part of the disk that stores the data being accessed (read or written).

It speeds up accessing recently used data.

## Random access memory (RAM)

It copies data from the disk buffer and stores it in 64-byte (512-bits) blocks called cache lines until the computer powers off.

#### Heap

It is a virtual space that has the size of the RAM (minus the stack) and behaves like a dictionary.

It stores (big and mutable) objects that failed to be in the stack and keeps track of their data addresses to avoid overwriting them, a process called allocation.
Most programs have a garbage collecting subprogram, which monitors its heap objects that become inaccessible and stops the bookkeeping so that their data addresses can be reused, a process called deallocation.

When making an array storing heap objects, it makes and stores pointers to their data addresses.
Accessing a stored object requires accessing its pointer and then its data address.

It stores global objects.

#### Stack

It is a virtual space that is small, layered, and accessed only from one end.

It stores a set of small related data (like that of an object or a local block) close and pads it to be a multiple of 1 byte.

Popping a stack layer deletes all of its data.

The Julia compiler also requires its objects to be concrete and immutable so that the CPU can copy them as it sees fit (copies of immutable objects are indistinguishable from the originals).

When making an array storing stack objects, it inlines their data within its own.
Accessing a stored object is direct.

## Central processing unit (CPU)

It is where all computations occur.

A 3-GHz CPU cycles 3,000,000,000 times per second.

Its temperature is the limiting factor for its performance.

#### Core

It is a half of the CPU and has its own CPU cache.

The CPU can work with two streams of instructions, each on a core, so that when one idles (from branch miss-prediction, cache miss, or waiting for an external resource like a server or the disk), the CPU executes the other, a process called hyperthreading.

Disabling hyperthreading improves the performance of (rare) well optimized code, which compiles to instructions that do not idle.

#### CPU cache

It is the copy of few cache line.

Copying one has a latency of 100 ns and takes 500 cycles.

Copying from the stack gets more data, which is also more likely to be used together.

Reading from here takes 1 cycle.

Reading a object whose data spans two cache lines, a misaligned object, takes 10 cycles.

Multiplying 80-by-80 matrix with less misaligned data can be twice as fast as 79-by-79 one with more misalignment.

If data is not found here, a cache miss, it copies again.

Accessing a hash table is O(1) and almost always results in a cache miss because its data is in the heap.

#### Prefetcher

It is next to the CPU cache and infers from the previously accessed RAM addresses the next ones and copies their cache lines.

## Register

They are 8-to-64-byte-sized spaces for executing micro operations on data from the CPU cache.

When a larger resister works with an uninterrupted (non-branching and fixed-length) iteration, contiguous data is reordered and operated simultaneously on the register, a process called "single instruction, multiple data (SIMD)" or "vectorization".

#### CPU instructions

They are what every program compiles to.

Assembly is a programming language that corresponds one-to-one with them.

They have varying latency and speed.

The CPU queues them to few of the registers.

#### Branch predictor

When there are branches in code, it infers from the recently used CPU instructions the next one to queue.

It simultaneously infers many future branches.

#### Micro operations

They are a set of even lower-level operations the CPU instructions translate to.

#### Reorder buffer

It stores over 200 micro operations while they reorder on many registers and execute in parallel.

It can make code with more, slower CPU instructions run faster than a code with fewer, faster instructions.

It idles if any of its micro operations depends on a previous operation.
