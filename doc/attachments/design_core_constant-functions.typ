// Attachment for doc/manual/design/core.md.
// Compiled to design_core_constant-functions.pdf by the site build.
#set document(title: "Constant functions and the unit type")
#set page(paper: "a4", margin: 2.5cm)
#set text(size: 11pt)
#set par(justify: true)
#set heading(numbering: "1.")

#align(center)[
  #text(size: 16pt, weight: "bold")[Constant functions and the unit type]

  luna-template, design note for the `core` package
]

= Setting

Read a MoonBit type as the set of its values. `Unit` has exactly one value,
so it is the one-point set $bold(1) = {star}$. A pure function without
arguments, such as `hello() -> String`, is a function $f : bold(1) -> S$.

= The bijection

*Proposition.* For every set $S$ the maps

$ Phi : "Hom"(bold(1), S) -> S, quad Phi(f) = f(star) $

$ Psi : S -> "Hom"(bold(1), S), quad Psi(s) = (star |-> s) $

are inverse to each other.

*Proof.* Let $s in S$. Evaluating the constant function at the only point
gives

$ Phi(Psi(s)) = (star |-> s)(star) = s. $

Let $f : bold(1) -> S$. Two functions with the same domain are equal when
they agree at every point. The domain $bold(1)$ has the single point $star$,
and

$ Psi(Phi(f))(star) = Phi(f) = f(star), $

so $Psi(Phi(f)) = f$. Hence $Phi compose Psi = "id"_S$ and
$Psi compose Phi = "id"_("Hom"(bold(1), S))$. #h(1fr) $square$

= Consequences for `hello`

+ The specification of `hello` is one value, the string
  `"hello from Luna-Flow"`.
+ A test that compares `hello()` with that string covers all
  $|bold(1)| = 1$ inputs, so it is exhaustive.
+ Any call `hello()` can be replaced by the literal without changing the
  meaning of a program.
