
import Collectional.Term
import Functional.Substitutor
import Apile.Testing.Batch
import Testing

type Domain   = (Term, Term, Term)
type Codomain = Term

oes = [
    (uglyEEE "n o i"    , uglyE "i"    ),
    (uglyEEE "n i i"    , uglyE "n"    ),
    (uglyEEE "n i ^pb"  , uglyE "^pb"  ),
    (uglyEEE "n o ^po"  , uglyE "^pn"  ),
    (uglyEEE "n o ·fa"  , uglyE "·fa"  ),
    (uglyEEE "n o >st"  , uglyE ">st"  ),
    (uglyEEE "n o ;:vuk", uglyE ";:vuk"),
    (uglyEEE "n o ;<vwk", uglyE ";<vwk")
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map substitution oris) :: [Codomain]
main = useNeither (map prettyEEE oris) (map prettyE exps) (map prettyE acts)

--
