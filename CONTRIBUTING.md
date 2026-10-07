# Contribution Guidelines

## Code Style

- Format all MoonBit code with `just fmt`.
- Keep files organized by package boundary first, then by behavior.
- Keep comments short and technical. Explain contracts, invariants, or non-obvious implementation choices.
- Separate top-level items with `///|`.
- Use `derive(Debug)` for structural output; implement `Show` only for types with a real text format.
- Declare trait-method promotions explicitly with `pub extend T with Trait::{...}` in the package's `extends.mbt`; keep deprecated items in `deprecated.mbt`.
- Package and module manifests use the `moon.pkg` / `moon.mod` DSL; do not add `moon.pkg.json` or `moon.mod.json`.

## Naming Conventions

- Bindings and functions: lowercase with underscores, such as `scaled_value`.
- Types and traits: PascalCase, such as `Solver`.
- Files: lowercase with underscores, named after concrete behavior.
- Error codes, if introduced, should use uppercase with underscores and an `E_` prefix.

## Testing

- Add or update tests whenever behavior changes.
- Use package-local `*_test.mbt` or `*_wbtest.mbt` files as appropriate.
- In blackbox tests (`*_test.mbt`), qualify names from the package under test, such as `@luna-template.hello()`.
- Declare test-only fixture types as `priv`.
- Run `just test` for normal validation and `just ready` before opening a PR.
- Regenerate public interface files with `just info` when public APIs change, and commit the `pkg.generated.mbti` diff.
- Run `just check-all` and `just test-all` when the change touches target-specific code.

## Documentation

- Write the manual in English under `doc/manual`; translations live only in the
  gettext catalogs under `doc/locale`.
- Run `lunadoc update` after editing pages and commit the refreshed catalogs
  with them.
- Run `lunadoc check --compile` before opening a PR. The `Docs` workflow runs
  the same check.
- Follow the [Luna-Flow documentation standard](https://luna-flow.github.io/en/contribute/documentation_standard/).

## Dependencies

- Update dependencies through `just update-deps`.
- Review `moon.mod` diffs before committing.
- Avoid changing dependency or version declarations in unrelated PRs.

## Commit Guidelines

- Use concise English Conventional Commit messages, such as `fix: handle empty input`.
- Keep each commit focused on one logical change.

## Release Checklist

- Update `version` in `moon.mod`.
- Ensure README and docs reflect the current package.
- Run `just ready`.
- Trigger the `publish-package` GitHub Actions workflow with the exact `moon.mod` version.
