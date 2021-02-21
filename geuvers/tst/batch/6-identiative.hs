
import Functional.Variator
import Apile.Testing.Batch
import Collectional.Term
import Testing

type Domain   = Term
type Codomain = [Term]

oes = [
    (uglyE "i"    , uglyEs "i"    ),
    (uglyE "^pb"  , uglyEs "p b"  ),
    (uglyE "·fa"  , uglyEs "f a"  ),
    (uglyE ";:vuk", uglyEs "v u k")
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map identiative oris) :: [Codomain]
main = useNeither
    (map prettyE oris)
    (map prettyEs exps)
    (map prettyEs acts)

--
