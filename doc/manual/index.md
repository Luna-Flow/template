# template

<!-- Overview page: what the repository provides, who it is for, a package map, reading paths, toolchain and installation. Keep it short; details belong on the package pages. -->

The `template` repository, with the MoonBit module `Luna-Flow/luna-template`,
is the starter repository that every new Luna-Flow MoonBit library is created
from. It contains the build, test, CI and documentation setup that the organisation expects, and one small root package
with a single function, `hello`, so that each of those pieces has something
real to check from the first commit. This manual documents that package, and
it is written to serve as a model of the
[documentation standard](https://lunaflow.cn/en/contribute/documentation_standard/):
when you start a new repository, keep the structure of these pages and replace
their content.

## Packages

<!-- One row per documented package. The page name is the package path under the source root; the package at the source root itself is called `core`. -->

| Package | Import path | Contents | Pages |
| --- | --- | --- | --- |
| `core` | `Luna-Flow/luna-template` | The fixed greeting `hello`. | [API](api/core.md) · [Tutorial](tutorial/core.md) · [Design](design/core.md) |

The package at the source root (`src/`) is documented under the name `core`.
A package at `src/<path>` would be documented as `api/<path>.md`,
`tutorial/<path>.md` and `design/<path>.md`.

## Reading paths

If you are new to the package, start with the [tutorial](tutorial/core.md): it
installs the module, calls `hello` and pins its value in a test. If you
already use it, the [API reference](api/core.md) lists every public name with
its exact signature and semantics. If you want to change the package, or
create a new repository from this template, read the
[design note](design/core.md) for the reasoning behind it and
[CONTRIBUTING.md](../../CONTRIBUTING.md) for the workflow.

## Toolchain

The module uses the `moon.mod` and `moon.pkg` manifest syntax and needs MoonBit
`moonc` 0.10 or later. Local workflows run through `just`; the manual is
checked with `lunadoc`, which needs Node.js, and Typst attachments need
`typst`.

## Installation

Add the module to your project:

```text
moon add Luna-Flow/luna-template@0.1.0
```

Then import the package in the `moon.pkg` of the package that uses it:

```text
import {
  "Luna-Flow/luna-template",
}
```

The package is then available as `@luna-template`.
