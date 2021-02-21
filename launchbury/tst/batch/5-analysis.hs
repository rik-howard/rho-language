
import Collectional.Heap
import Collectional.Term
import Functional.Analyser
import Apile.Testing.Batch
import Testing

type Domain   = String
type Codomain = (Int, Heap, Term)

oes = [
    ("0 ø ·f^ib", uglyNHE 2 "ø ;:1^0b·f1")
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map analysis oris) :: [Codomain]
main = useNeither oris (map prettyNHE exps) (map prettyNHE acts)

--
