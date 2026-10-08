# core tutorial

<!-- Tutorial page: state the goal in the first paragraph, then Quick start, Everyday tasks, Going further, Common pitfalls and Next steps. Every `moonbit` block must compile; show the output of each program. Keep the mathematics on the design page. -->

This tutorial takes you from adding `luna-template` to a project to using its
greeting in your own code and tests. By the end you can call `hello`, build
messages from it, pass it around as a function value and pin its value in a
test.

## Quick start

Add the module to your project:

```text
moon add Luna-Flow/luna-template@0.1.0
```

Import the package in the `moon.pkg` of an executable package:

```text
import {
  "Luna-Flow/luna-template",
}

pkgtype(kind: "executable")
```

The smallest useful program prints the greeting:

```moonbit
fn main {
  println(@luna-template.hello())
}
```

`moon run` prints:

```text
hello from Luna-Flow
```

## Everyday tasks

<!-- Three to six tasks of increasing depth. Each one is a complete example that compiles, followed by its output. -->

### Build a message from the greeting

`hello` returns an ordinary `String`, so you can interpolate it like any other
value:

```moonbit
fn welcome(name : String) -> String {
  "\{@luna-template.hello()}, \{name}!"
}

test "welcome a user" {
  inspect(welcome("Ada"), content="hello from Luna-Flow, Ada!")
}
```

### Pin the greeting in a test

A snapshot test records the exact value. Because `hello` has no inputs, this
one test covers its whole behaviour:

```moonbit
test "greeting snapshot" {
  inspect(@luna-template.hello(), content="hello from Luna-Flow")
}
```

`moon test` reports:

```text
Total tests: 1, passed: 1, failed: 0.
```

When an intended change alters the text, `moon test --update` rewrites the
`content` argument for you.

### Check properties instead of the exact text

When your code only relies on part of the greeting, test that part, so the test
states what you depend on:

```moonbit
test "greeting properties" {
  let greeting = @luna-template.hello()
  assert_true(greeting.has_prefix("hello"))
  assert_true(greeting.contains("Luna-Flow"))
  assert_eq(greeting.length(), 20)
}
```

### Pass the greeting as a function value

`hello` has the type `() -> String`, so you can hand it to code that expects a
message source, and substitute another source in tests:

```moonbit
fn banner(source : () -> String) -> String {
  let text = source()
  let rule = "-".repeat(text.length())
  "\{rule}\n\{text}\n\{rule}"
}

test "banner from hello" {
  inspect(
    banner(@luna-template.hello),
    content=(
      #|--------------------
      #|hello from Luna-Flow
      #|--------------------
    ),
  )
}
```

## Going further

The package has no traits or types to extend, so going further means treating
the greeting as data. Pass `@luna-template.hello` wherever your code needs a
`() -> String`, as in `banner` above, and pass a different closure in tests:
`banner(() => "x")` exercises the same code without the dependency. Calling
`hello` costs constant time, so there is no need to cache its result. There is
no error handling to do either: `hello` cannot fail.

## Common pitfalls

- In a blackbox test (`*_test.mbt`), write `@luna-template.hello()`. An
  unqualified `hello()` triggers the `test_unqualified_package` warning, and
  Luna-Flow repositories keep `moon check` free of warnings.
- `inspect` prints a `String` without quotes, so the snapshot is
  `content="hello from Luna-Flow"`, not `content="\"hello from Luna-Flow\""`.
- The greeting is not translated. The manual is available in several
  languages, but `hello` always returns the English text.

## Next steps

The [API reference](../api/core.md) states the exact signature and law of
`hello`, and the [design note](../design/core.md) explains why the package is a
constant function and why one test is enough. To see the same page structure
applied to real algebra, read the manual of
[luna-generic](https://lunaflow.cn/en/luna-generic/).
