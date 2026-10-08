# template

<!-- Overview page. Keep this order: one line naming the documented release, Overview, Install, Pages, the exported items grouped by purpose, Where to read next, Validation. Details belong on the package pages. -->

This manual documents version `v0.1.0` of `Luna-Flow/luna-template`.

## Overview

The `template` repository is the starter repository that every new Luna-Flow
MoonBit library is created from. It contains the build, test, CI and
documentation setup that the organisation expects, and one small root
package with a single function, `hello`, so that each of those pieces has
something real to check from the first commit.

This manual documents that package and is a model of the
[documentation standard](https://lunaflow.cn/en/contribute/documentation_standard/):
when you start a new repository, keep the structure of these pages and
replace their content.

## Install

```bash
moon add Luna-Flow/luna-template@0.1.0
```

Then import `"Luna-Flow/luna-template"` in your `moon.pkg`; the package is
available as `@luna-template`. The module needs the MoonBit toolchain 0.10 or
later (`moonc` ≥ 0.10). Local workflows run through `just`; the manual is
checked with `lunadoc`, which needs Node.js, and Typst attachments need
`typst`.

## Pages

<!-- One row per documented package, plus rows for guides. The page name is the package path under the source root; the package at the source root itself is called `core`. -->

The repository is one MoonBit package at `src`, documented as `core`. A
package at `src/<path>` would be documented as `api/<path>.md`,
`tutorial/<path>.md` and `design/<path>.md`.

| Part | Tutorial | API | Design |
| --- | --- | --- | --- |
| `core`: the fixed greeting `hello` | [tutorial](tutorial/core.md) | [API](api/core.md) | [design](design/core.md) |

## Exported functions

- Greeting: `hello`

## Where to read next

The [tutorial](tutorial/core.md) installs the module, calls `hello` and pins
its value in a test. The [API](api/core.md) states its exact signature and
law, and the [design](design/core.md) explains why the package is a constant
function and why one test checks it completely.

- New to the package: read the [tutorial](tutorial/core.md).
- Using it in a library: keep the [API](api/core.md) at hand.
- Contributing, or creating a new repository from this template: read the
  [design](design/core.md) and [CONTRIBUTING.md](../../CONTRIBUTING.md).

## Validation

Recommended release checks:

```bash
moon check --target all
moon test
```

`just ready` runs these together with formatting, `moon info` and coverage.
