
import Collectional.Heap
import Collectional.Term
import Functional.Evaluator
import Apile.Testing.Batch
import Testing

type Domain   = (Int, Heap, Term)
type Codomain = (Int, Heap, Term)

oes = [
    (uglyNHE 0 "      ø ^ib", uglyNHE 0 "      ø ^ib"),
    (uglyNHE 0 ";:i^pbø i"  , uglyNHE 1 ";:i^pbø ^0b")
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map evaluation oris) :: [Codomain]
main = useNeither (map prettyNHE oris) (map prettyNHE exps) (map prettyNHE acts)

--
