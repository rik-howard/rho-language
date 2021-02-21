
import Collectional.Term
import Apile.Testing.Batch

type Domain   = String
type Codomain = (String, Term)

oes = [
    ("ix",     ("x", Idn "i")                                ),
    ("^ibx",   ("x", Abn (Idn "i") (Idn "b"))                ),
    ("·fax",   ("x", Apn (Idn "f") (Idn "a"))                ),
    (";:iukx", ("x", Cpn (Ain (Idn "i") (Idn "u")) (Idn "k")))
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map enterming oris) :: [Codomain]
main = useRight oris exps acts

--
