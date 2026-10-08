# Changelog

All notable changes to this repository are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and versions follow
[Semantic Versioning](https://semver.org/).

## Unreleased

### Added

- Template repository: `moon.mod`/`moon.pkg` manifests, `justfile`, CI, docs
  and publish workflows, issue templates, the gettext documentation layout and
  the sample `hello` package.

### Changed

- Require MoonBit `moonc` 0.10: blackbox tests qualify names from the package
  under test (`@luna-template.hello()`), and the contribution guide describes
  explicit method promotion through `extends.mbt` and `priv` test fixtures.
- Commit `pkg.generated.mbti` instead of ignoring it, so interface diffs show
  public API changes.
- `just ready` checks every target; new `just test-all` runs the tests on
  `wasm-gc`, `js`, `native` and `wasm`.
- Ignore local AI agent state (`.claude/`, `.codex/`, `.cursor/`, ...).
- Documentation rewritten (API, tutorial and design pages for `core`, with a
  Typst attachment) as a model of the documentation standard, with zh_CN and
  ja_JP translations.

