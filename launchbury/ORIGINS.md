


# Rho: Language: Launchbury: Origins
> *A Natural Semantics for Lazy Evaluation*<br/>
  John Launchbury<br/>
  POPL '93


## 3 Modelling Laziness

### 3.1 Normalising Terms
[Syntax]

    x ∈ Var
    e ∈ Exp
      ::= λx.e
        | e x
        | x
        | let x1 = e1, ..., xN = eN in e

The process of normalisation can be specified in two stages.  The first, which we write as `ê`, is simply α-conversion: a renaming of all the bound variables in `e` using completely fresh variables.  The second, which we write as `e*`, ensures that function arguments are always variables.  It is defined as follows.  [Regulation]

    (λx.e)* = λx.(e*)
    x*      = x
    (let x1 = e1, ..., xN = eN in e)*
            = let x1 = (e1*), ..., xN = (eN*) in (e*)
    (e x)*  = (e*) x
    (e1 e2) = let y = (e2*) in (e1*) y

Thus, apart from α-conversion, normalisation consists purely of naming the argument terms in applications, and expressing that naming using let.

### 3.2 Dynamic Semantics
[Convention]

    Γ, Δ, Θ ∈ Heap = Var → Exp
          z ∈ Val ::= λx. e

Judgements [are] of the form

    Γ: e ↓ Δ: z

### 3.2.1 Reduction Rules
The most intriguing rule is the Variable rule.  This is where sharing is captured.  To evaluate a variable x in the context of some heap, the heap must contain a binding of the form `x ↦ e`.  Assuming this is the case, `e` is reduced in the context of the heap omitting the reference to `x`.  If this reduction produces a value `z`, the new heap is augmented with the binding `x ↦ z`, and a renamed version of `z` is returned as the result.  This is a natural place for renaming to occur, as it is only here that terms may be duplicated.  As we will show later, this one occurrence of renaming is sufficient to avoid all unwanted name capture.

What if `x` is recursive, and `e` has a (possibly indirect) reference back to `x`?  It may seem that reducing `e` in the context of a heap which contains no reference to `x` could cause a problem.  There are two possibilities: either `e` reduces to whnf without requiring the value of `x`, in which case we reintroduce a binding for `x` (binding it to its value now), or else `e` requires the value of `x` before reducing to whnf.  This means that `x` depends directly on itself before any value can be returned, so should have denotation `⊥`.  In this latter case we will attempt to reduce `x` in a heap containing no reference to `x`.  As there is no rule which covers this situation, the proof for the reduction sequence fails.  Note that the variable rule is the only place where the proof may actually fail.  (Once we add constants, the Application rule could cause failure on a type-incorrect term.)  Figure 1: Reduction Rules

    Γ ⊢ λie  ↦  Γ ⊢ λie                            Lambda

    Γ ⊢ e  ↦  Δ ⊢ λie′    Δ ⊢ e′«x/i»  ↦  Θ ⊢ z
    ───────────────────────────────────────────    Application
                 Γ ⊢ e x  ↦  Θ ⊢ z

           Γ ⊢ e  ↦  Δ ⊢ z
    ─────────────────────────────                  Variable
    (Γ, x=e) ⊢ x  ↦  (Δ, x=z) ⊢ z

      (Γ, x1=e1, ..., xN=eN) ⊢ e  ↦  Δ ⊢ z
    ────────────────────────────────────────       Let
    Γ ⊢ let x1=e1, ..., xN=eN in e  ↦  Δ ⊢ z



## 4 Examples

### 4.1 Recursion
[Simplest]

    let x = x in x

[Black Hole]

    let f = λx. fx in f2

[Direct]

    let fix = λf. f (fix f) in fix

[Alternative]

    let fix = λf. (let x = f x in x) in fix
