


# Rho: Language: Launchbury: Machine


## Declaration

### Sets
|    Set    | Description
|:---------:|:------------
|     N     | the set of all (meta) naturals
|     S     | the set of all (meta) strings
|     Λ     | the set of all terms
|     Γ     | the set of all heaps (vaults)

### Relations
|  Relation |    Domain   | Description
|:---------:|:-----------:|:------------
|     Φ     |      Λ      | a term is in normal form

### Functions
|  Function |  Transition | Description
|:---------:|:-----------:|:------------
|     ξ     |    S → NΓΛ  | the execution of a string
|     ω     |  NΓΛ → NΓΛ  | the evaluation of a term wrt a heap and a natural
|     ρ     |  NΓΛ → NΓΛ  | the reduction of a term wrt an evaluation, a heap and a natural
|     θ     |   NΛ → NΛ   | the regulating of a term wrt a natural
|     α     |   NΛ → NΛ   | the distinguishing of a term wrt a natural
|     σ     |  ΛΛΛ → Λ    | the substitution of new for old in a term
|     ψ     |    S → NΓΛ  | the analysis of a string
|     γ     |    S → SΓ   | the heap of a string
|     λ     |    S → SΛ   | the term of a string


## Definition
Execution [`↦`]

    ξ x  ↦  ωψx

### Syntax
Analysis [`⇐`, `↤`, `∧`, `0`]

    ψ x  ↦  nhe′    ⇐    x′h ↤ γx  ∧  x″e ↤ λx′  ∧  ne′ ↤ θα0e

Heap [`¢`, `~`]

    γ ¢cx    ↦  xø         ⇐    c ~ ø
    γ ¢c¢dx  ↦  x‴;:vuh    ⇐    c ~ ;  ∧  d ~ =  ∧  x′v ↤ λx  ∧  x″u ↤ λx′  ∧  x‴h ↤ γx″

Term

    λ ¢cx    ↦  x″^pb      ⇐    c ~ ^  ∧  x′p ↤ λx  ∧  x″b ↤ λx′
    λ ¢cx    ↦  x″·fa      ⇐    c ~ ·  ∧  x′f ↤ λx  ∧  x″a ↤ λx′
    λ ¢c¢dx  ↦  x‴;:vuk    ⇐    c ~ ;  ∧  d ~ =  ∧  x′v ↤ λx  ∧  x″u ↤ λx′  ∧  x‴k ↤ λx″
    λ ¢cx    ↦  xi

Distinguishing [`+`]

    α n i      ↦  ni
    α n ^pb    ↦  n″^nb″       ⇐    n′b′ ↤ +n1σnpb  ∧  n″b″ ↤ αn′b′
    α n ·fa    ↦  n″·f′a′      ⇐    n′f′ ↤ αnf  ∧  n″a′ ↤ αn′a
    α n ;:vuk  ↦  n″;:vu′k′    ⇐    n′u′ ↤ αnu  ∧  n″k′ ↤ αn′k

Substitution

    σ n o i      ↦  n              ⇐    o ~ i
    σ n o i      ↦  i
    σ n o ^pb    ↦  ^pb            ⇐    o ~ p
    σ n o ^pb    ↦  ^pσnob
    σ n o ·fa    ↦  ·σnofσnoa
    σ n o ;:vuk  ↦  ;:vσnouσnok

Regulating

    θ n i      ↦  ni
    θ n ^pb    ↦  n′^pb′         ⇐    n′b′ ↤ θnb
    θ n ·fi    ↦  n′·f′i         ⇐    n′f′ ↤ θn′f
    θ n ·fa    ↦  n″;:na′·f′n    ⇐    n′a′ ↤ θ+n1a  ∧  n″f′ ↤ θn′f
    θ n ;:vuk  ↦  n″;:vu′k′      ⇐    n′u′ ↤ θnu  ∧  n″k′ ↤ θn′k

### Semantics
Evaluation

    ω n h e  ↦  nhe        ⇐    Φe
    ω n h e  ↦  ω(ρnhe)

Normal form: weak head [`∃`]

    Φ ^pb

Reduction: Lambda, Application, Variable, Let

    ρ n ;:vuh v      ↦  n′ ;:vuh   u′      ⇐    Φu  ∧  n′u′ ↤ αnu
    ρ n ;:vuh v      ↦  n′ ;:vu′h′ v       ⇐    n′h′u′ ↤ ρnhu
    ρ n ;:vuh i      ↦  n′ ;:vuh′  i′      ⇐    n′h′i′ ↤ ρnhi
    ρ n     h ^pb    ↦  n      h   ^pb
    ρ n     h ·^pba  ↦  n      h   σapb
    ρ n     h ·fa    ↦  n′     h′  ·f′a    ⇐    n′h′f′ ↤ ρnhf
    ρ n     h ;:vuk  ↦  n  ;:vuh   k
