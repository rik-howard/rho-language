
import Collectional.Heap
import Collectional.Term
import Apile.Testing.Batch

type Domain   = String
type Codomain = (String, Heap)

oes = [
    ("øx"        , ("x", Emn)                              ),
    (";:vuøx"    , ("x", Cpn (Ain (Idn "v") (Idn "u")) Emn)),
    (";<vwøx"    , ("x", Cpn (Ayn (Idn "v") (Idn "w")) Emn))
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map enheaping oris) :: [Codomain]
main = useRight oris exps acts

--
