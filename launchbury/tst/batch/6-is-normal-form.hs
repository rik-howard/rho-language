
import Collectional.Term
import Relational.Informer
import Apile.Testing.Batch
import Testing

type Domain   = Term
type Codomain = Bool

oes = [
    (uglyE "i"  , False),
    (uglyE "^ib", True )
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map isNF oris) :: [Codomain]
main = useRight (map prettyE oris) exps acts

--
