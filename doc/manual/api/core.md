# core API

<!-- API page: Purpose, Importing, then every public name in pkg.generated.mbti, grouped by purpose, and nothing else. Each item: a heading named after it in code, a first sentence saying what it does, the exact signature in an `mbti` block, its laws and edge behaviour (in TeX where mathematical), and a short example that compiles. -->

## Purpose

The root package of `Luna-Flow/luna-template` exports one function, `hello`,
which returns a fixed greeting. It exists so that a new repository has one
public item to build, test and document. Its public surface is recorded in
`src/pkg.generated.mbti`; the reasons behind it are in the
[design](../design/core.md).

## Importing

Add the package to your `moon.pkg`:

```moonbit nocheck
import {
  "Luna-Flow/luna-template",
}
```

The examples on this page call it as `@luna-template`. A package with many
items would bring them into scope here with one `using @pkg { ... }` block.

## Greeting

<!-- Group items by purpose under `##` headings and give each item a `###` heading. Put deprecated items last, under `## Deprecated`, each with its replacement. -->

### `hello`

Returns the fixed greeting `hello from Luna-Flow`.

```mbti
pub fn hello() -> String
```

`hello` takes no arguments and returns the same 20-character string on every
call. It has no preconditions, never raises and never aborts, and it runs in
constant time. Because it has no inputs and no effects, it satisfies the law

$$
\texttt{hello}() = \texttt{"hello from Luna-Flow"}
$$

on every backend, so any call can be replaced by the literal. The
[design note](../design/core.md) explains why a constant function was chosen
and why a single test checks it completely.

```moonbit
test "hello returns the fixed greeting" {
  let greeting = @luna-template.hello()
  inspect(greeting, content="hello from Luna-Flow")
  assert_eq(greeting.length(), 20)
}
```
