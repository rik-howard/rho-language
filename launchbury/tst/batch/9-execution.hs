
import Collectional.Heap
import Collectional.Term
import Functional.Executor
import Apile.Testing.Batch
import Testing

type Domain   = String
type Codomain = (Int, Heap, Term)

oes = [
    ("0 ;:i^pbø i", uglyNHE 1 ";:i^pbø ^0b")
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map execution oris) :: [Codomain]
main = useNeither oris (map prettyNHE exps) (map prettyNHE acts)

--
