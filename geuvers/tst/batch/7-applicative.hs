
import Functional.Variator
import Apile.Testing.Batch
import Collectional.Term
import Testing

type Domain   = Term
type Codomain = [Term]

oes = [
    (uglyE "i"    , uglyEs ""   ),
    (uglyE "^pb"  , uglyEs ""   ),
    (uglyE "·fa"  , uglyEs "·fa"),
    (uglyE ";:vuk", uglyEs ""   )
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map applicative oris) :: [Codomain]
main = useNeither
    (map prettyE oris)
    (map prettyEs exps)
    (map prettyEs acts)

--
