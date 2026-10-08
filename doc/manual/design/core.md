# core design

<!-- Design page: Design goal, Constraints, Mathematical background (definitions and derivations in TeX), Design decisions (problem, options, choice and why), Correctness / invariants, Alternatives rejected, and Boundaries last. Describe only mathematics the code implements. -->

## Design goal

The root package exists so that a repository created from the template is
complete on its first commit. Continuous integration needs code to build on
every backend, `moon info` needs a public item to record in the interface
file, the test suite needs a behaviour to check, and each chapter of the
manual needs an item to describe. `hello` is the smallest item that serves all
four, and its behaviour can be stated exactly in one equation.

## Constraints

- The package must build and test on every backend (`wasm-gc`, `wasm`, `js`
  and `native`) without target-specific code.
- It must not depend on other packages, so that a new repository starts with
  an empty dependency list.
- Every new repository deletes it, so it must be trivial to remove.

## Mathematical background

<!-- State definitions and the properties the design relies on, in TeX. Put long proofs in a Typst attachment linked on its own line. -->

Read a MoonBit type as the set of its values. The type `Unit` has exactly one
value, so it is the one-point set $\mathbf{1} = \{\star\}$, and a function
that takes no arguments and has no effects is a function
$f : \mathbf{1} \to S$. Such a function is determined by its single value.

$$
\Phi : \operatorname{Hom}(\mathbf{1}, S) \to S, \quad \Phi(f) = f(\star),
\qquad
\Psi : S \to \operatorname{Hom}(\mathbf{1}, S), \quad \Psi(s) = (\star \mapsto s).
$$

The two maps are inverse to each other. For every $s \in S$ and every
$f : \mathbf{1} \to S$:

$$
\begin{aligned}
\Phi(\Psi(s)) &= (\star \mapsto s)(\star) = s, \\
\Psi(\Phi(f))(\star) &= \Phi(f) = f(\star),
\quad\text{and } \star \text{ is the only point of } \mathbf{1},
\text{ so } \Psi(\Phi(f)) = f.
\end{aligned}
$$

So $\operatorname{Hom}(\mathbf{1}, S) \cong S$: specifying a pure function
without arguments is the same as specifying one value.[^unit] The attachment
writes the argument out in full.

[^unit]: In category theory the bijection is natural in $S$, so the functor
$\operatorname{Hom}(\mathbf{1}, -)$ is isomorphic to the identity functor on
sets: a set is recovered, up to isomorphism, from the maps out of
$\mathbf{1}$. In particular $\mathbf{1}$ is a generator: two different maps
$g \neq h : S \to T$ differ at some point $\star \mapsto s$.

[Constant functions and the unit type](../../attachments/design_core_constant-functions.typ)

## Design decisions

### A constant function as the only item

The problem is to give a new repository one public item whose behaviour can be
documented and tested completely, on every backend, without tying the template
to a mathematical domain. Three shapes were considered: a constant function
`hello() -> String`, a function of an argument such as `greet(name) -> String`,
and a constant value `pub let greeting : String`.

The constant function was chosen. By the background above, its whole
specification is the single equation
$\texttt{hello}() = \texttt{"hello from Luna-Flow"}$, so the API page can
state it exactly and the tests can check it exactly. A function of an argument
has one equation per input string, infinitely many, so any test only samples
it. A constant value is just as simple, but it would model a `pub let` item
rather than the function signatures that real packages mostly export.

### One snapshot test is exhaustive

A test suite proves correctness only when it covers every input. For `hello`
the input set is $\mathbf{1}$, so the count of cases is

$$
\lvert \mathbf{1} \rvert = 1 ,
$$

and a single passing `inspect(@luna-template.hello(), content=c)` shows
$\texttt{hello}(\star) = c$, hence $\texttt{hello} = \Psi(c)$ by the
bijection above: the function equals its specification. The argument uses
that `hello` is pure (the determinism invariant below) and holds for the
backend the test runs on; `just test-all` repeats it on all four.
The package therefore has one test and no property tests; adding more would
check nothing new.

### The root package is documented as `core`

The standard names a page after the package path under the source root. The
root package has the empty path, so the template uses the name `core`, as
`luna-generic` does. A repository that adds `src/<path>` documents it as
`<path>.md` in each chapter.

## Correctness / invariants

- **Determinism.** `hello` reads no state and performs no effects, so
  $\texttt{hello}() = \texttt{hello}()$ for any two calls, on any backend.
- **Length.** The result has $5 + 1 + 4 + 1 + 9 = 20$ UTF-16 code units, for
  `hello`, the two spaces, `from` and `Luna-Flow`. The test asserts this.
- **Portability.** The package has no target-specific files, so `wasm-gc`,
  `wasm`, `js` and `native` build the same code; `just check-all` and
  `just test-all` check all four.
- **Cost.** A call returns a string literal and takes constant time.

## Alternatives rejected

- **An empty package.** It leaves the interface file, the tests and the API
  page with nothing to check, so mistakes in the setup go unnoticed until the
  first real item arrives.
- **A small numeric example.** It would tie the template to one domain and to
  the Luna-Flow packages that domain needs, and every new repository would have
  to remove those dependencies first.
- **A greeting with an argument.** As derived above, it cannot be tested
  exhaustively, which would make the model test suite misleading.

## Boundaries

The package does not read input, print, or depend on any other package. It
does not localise the greeting: the manual is translated, but `hello` always
returns the English text. It is not meant to be depended on; a repository
created from the template replaces it with its own packages.
