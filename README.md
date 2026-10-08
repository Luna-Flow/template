# template

This repository, with the MoonBit module `Luna-Flow/luna-template`, is the
starter repository for Luna-Flow MoonBit libraries. It provides the manifests, `justfile`, CI, publishing workflow,
issue templates and documentation layout that every Luna-Flow repository
shares, together with one small package, so a repository created from it
builds, tests and passes the documentation check on its first commit.

## The sample package

The root package exports a single function, `hello`, which returns the fixed
greeting `hello from Luna-Flow`:

```moonbit
fn main {
  println(@luna-template.hello())
}
```

| Package | Import path | Contents |
| --- | --- | --- |
| `core` | `Luna-Flow/luna-template` | The fixed greeting `hello`. |

To use it from another module, run
`moon add Luna-Flow/luna-template@0.1.0` and import `"Luna-Flow/luna-template"`
in your `moon.pkg`.

## Requirements

- MoonBit `moonc` 0.10 or later (the manifests use the `moon.mod` and
  `moon.pkg` syntax).
- [`just`](https://github.com/casey/just) for local workflows.
- Node.js and [Typst](https://typst.app/) for documentation checks.

## Starting a new repository

1. Set `name`, `version`, `repository`, `keywords` and `description` in
   `moon.mod`.
2. Replace the sample package under `src/` with your packages, and run
   `just info` to regenerate each `pkg.generated.mbti`.
3. Rewrite `doc/manual/` for your packages, keeping the structure of the
   sample pages, and set `title` and `summary` in `doc/conf.json`. The HTML
   comments in the sample pages say what goes where; delete them when you are
   done.
4. Replace this README with one for your repository, and start the
   `CHANGELOG.md` history afresh.
5. Update `NOTICE` if your repository needs a more specific copyright notice.
6. Configure the `LUNA_MOONCAKE` repository secret before using the publish
   workflow.

## Development

```text
just fmt          # format
just check        # type-check the default target
just check-all    # type-check every target
just test         # run the tests
just test-all     # run the tests on wasm-gc, js, native and wasm
just info         # regenerate pkg.generated.mbti
just ready        # format, check all targets, regenerate interfaces, test with coverage
just update-deps  # upgrade every dependency in moon.mod
```

`just ready` is the pre-pull-request workflow. The `pkg.generated.mbti` files
are committed, so their diff shows every change to the public API.

## Documentation

The manual starts at [`doc/manual/index.md`](doc/manual/index.md). The
template itself is not published on the documentation site; a repository
created from it appears at `https://lunaflow.cn/en/<repo>/`. The manual
follows the [Luna-Flow documentation standard](https://lunaflow.cn/en/contribute/documentation_standard/):
English pages in `doc/manual`, one API, tutorial and design page per package,
Typst attachments in `doc/attachments`, and Chinese and Japanese translations
as gettext catalogs in `doc/locale`. The `Docs` workflow checks it on every
pull request.

## Publishing

Publishing is handled by `.github/workflows/publish.yml`:

1. Set `version` in `moon.mod` to the exact version to publish.
2. Run `just ready`.
3. Trigger the `publish-package` workflow manually.
4. Enter the exact `moon.mod` version as `release_version`.

The workflow validates the version, checks the package with frozen
dependencies, and publishes it with `moon publish --frozen`.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for code style, testing, documentation
and commit conventions.

## License

Apache-2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
