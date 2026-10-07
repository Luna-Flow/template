# Luna-Flow template

Replace this page with an overview of the repository: what it provides, who it
is for, and where a reader should start.

## Packages

| Package | Contents |
| --- | --- |
| [`core`](api/core.md) | One sentence on what the package provides. |

Add one row for every documented package. Each documented package has a page
in the API, Design and Tutorial chapters, named after its path under `src/`;
this template's root package is documented as `core`.

## Writing the manual

English pages in `doc/manual` are the only source. After editing them, run
`lunadoc update` to refresh the translation catalogs in `doc/locale`, and
`lunadoc check` before opening a pull request. The
[documentation standard](https://luna-flow.github.io/en/contribute/documentation_standard/)
describes the layout and what each page contains.
