


# Rho: Language: Launchbury: Finians


## 3 Modelling Laziness

### 3.1 Normalising Terms
Syntax

    Idn ⊂ Abn ⊂ Apn ⊂ Ptn = Λ
    i, p, v       ∊ Idn
    b, f, a, u, k ∊ Ptn
    t ∊ Λ
      ::= i        Idn [c]
        | ^pb      Abn p b
        | ·fa      Apn f a
        | ;:vuk    Ptn v u k = Cpn (Ain v u) k

Regulation [`Fresh`]

    θ: Λ → Λ

    θ i      ↦  i
    θ ^pb    ↦  ^pθb
    θ ·fi    ↦  ·θfi
    θ ·fa    ↦  ;:xθa·θfx    ⇐    x ∊ Idn  ∧  Fresh x
    θ ;:vuk  ↦  ;:vθuθk

### 3.2 Dynamic Semantics
Convention

    h ∊ Γ
      ::= Ø        Emn
        | ;:vuh    Cpn (Ain v u) h
    Φ ^pb

Judgement

    ρ: Γ Λ → Γ Λ
    ρ h t  ↦  h′ t′    ⇐    h′t′ ↤ ...  ∧  ...

### 3.2.1 Reduction Rules
Figure 1: Reduction Rules [ω, α, σ]

    ρ ;:iuh i      ↦  ;:iu′h u″      ⇐    h′u′ ↤ ωhu  ∧  u″ ↤ αu′
    ρ ;:vuh i      ↦  ;:vuh′ i′      ⇐    h′i′ ↤ ρhi
    ρ     h ^pb    ↦      h  ^pb
    ρ     h ·^pba  ↦      h  σapb
    ρ     h ·fa    ↦      h′ ·f′a    ⇐    h′f′ ↤ ρhf
    ρ     h ;:vuk  ↦  ;:vuh  k

[Or my small-step reduction -- no ω but Φ]

    ρ ;:iuh i      ↦  ;:iuh   u′     ⇐    Φu  ∧  u′ ↤ αu
    ρ ;:iuh i      ↦  ;:iu′h′ i      ⇐    h′u′ ↤ ρhu
    ρ ;:vuh i      ↦  ;:vuh′  i′     ⇐    h′i′ ↤ ρhi


## 4 Examples

### 4.1 Recursion
[Simplest]

    ; :xx x

[Black Hole]

    ; :f^x·fx ·f2

[Direct]

    ; :F^f·f·Ff F

[Alternative]

    ;:F^f;:x·fxxF
