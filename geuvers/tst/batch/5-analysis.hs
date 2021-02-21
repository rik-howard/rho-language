
import Collectional.Heap
import Collectional.Term
import Functional.Analyser
import Apile.Testing.Batch
import Testing

type Domain   = String
type Codomain = (Int, Heap, Term, Term)

oes = [
    ("0 ø X ·f^pb", uglyNHEY 2 "ø X ;:1^0b·f1")
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map analysis oris) :: [Codomain]
main = useNeither oris (map prettyNHYE exps) (map prettyNHYE acts)

--
