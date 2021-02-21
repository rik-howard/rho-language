
import Collectional.Term
import Functional.Substitutor
import Apile.Testing.Batch
import Testing

type Domain   = (Term, Term, Term)
type Codomain = Term

oes = [
    (uglyEEE "n o i"    , uglyE "i"    ),
    (uglyEEE "n i i"    , uglyE "n"    ),
    (uglyEEE "n i ^ib"  , uglyE "^ib"  ),
    (uglyEEE "n o ^io"  , uglyE "^in"  ),
    (uglyEEE "n o ·fa"  , uglyE "·fa"  ),
    (uglyEEE "n o ;:iuk", uglyE ";:iuk")
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map substitution oris) :: [Codomain]
main = useNeither (map prettyEEE oris) (map prettyE exps) (map prettyE acts)

--
