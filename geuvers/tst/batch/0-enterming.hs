
import Collectional.Term
import Apile.Testing.Batch

type Domain   = String
type Codomain = (String, Term)

oes = [
    ("ix",     ("x", Idn "i")                                ),
    ("^pbx",   ("x", Abn (Idn "p") (Idn "b"))                ),
    ("·fax",   ("x", Apn (Idn "f") (Idn "a"))                ),
    (">stx",   ("x", Trn (Idn "s") (Idn "t"))                ),
    (";:vukx", ("x", Cpn (Ain (Idn "v") (Idn "u")) (Idn "k"))),
    (";<vwkx", ("x", Cpn (Ayn (Idn "v") (Idn "w")) (Idn "k")))
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map enterming oris) :: [Codomain]
main = useRight oris exps acts

--
