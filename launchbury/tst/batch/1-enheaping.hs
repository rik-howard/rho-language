
import Collectional.Heap
import Collectional.Term
import Apile.Testing.Batch

type Domain   = String
type Codomain = (String, Heap)

oes = [
    ("øx"        , ("x", Emn)                              ),
    (";:iuøx"    , ("x", Cpn (Ain (Idn "i") (Idn "u")) Emn))
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map enheaping oris) :: [Codomain]
main = useRight oris exps acts

--
