# Luna-Flow MoonBit Repository Template

This repository is the standard starter layout for Luna-Flow MoonBit packages.

## First-Time Setup

1. Rename the module in `moon.mod`.
2. Update `version`, `repository`, `keywords`, and `description` in `moon.mod`.
3. Replace this README with the package-specific overview.
4. Replace the placeholder documentation under `doc/manual/` and set `title` and `summary` in `doc/conf.json`.
5. Replace the placeholder source package under `src/`.
6. Update `NOTICE` if the generated repository needs a more specific copyright notice.
7. Configure the `LUNA_MOONCAKE` repository secret before using the publish workflow.

## Development

Use `just` for local workflows:

```bash
just fmt
just check
just check-all
just test
just test-all
just ready
just update-deps
```

`just ready` is the default pre-PR workflow: it formats, checks, refreshes public interface files, and runs coverage-enabled tests.

## Documentation

The manual follows the
[Luna-Flow documentation standard](https://luna-flow.github.io/en/contribute/documentation_standard/).
Published repositories appear at `https://luna-flow.github.io/en/<repo>/`.

- `doc/conf.json`: repository title, one-sentence summary, and translated locales.
- `doc/manual/index.md`: overview of the repository.
- `doc/manual/api/<package>.md`, `doc/manual/design/<package>.md`, and
  `doc/manual/tutorial/<package>.md`: one page per package in each chapter.
- `doc/locale/`: gettext catalogs with the Chinese and Japanese translations.

English pages are the only source. After editing them, refresh the catalogs
with `lunadoc update` and validate with `lunadoc check --compile`; the `Docs`
workflow runs the same check on every pull request. See
[CONTRIBUTING.md](./CONTRIBUTING.md) for the full workflow.

## Publishing

Publishing is handled by `.github/workflows/publish.yml`.

Before dispatching the workflow:

1. Set `version` in `moon.mod` to the exact version to publish.
2. Run `just ready`.
3. Trigger the `publish-package` workflow manually.
4. Enter the exact `moon.mod` version as `release_version`.

The workflow validates the input version, checks the package with frozen dependencies, and publishes through `moon publish --frozen`.
