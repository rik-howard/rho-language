
import Collectional.Term
import Functional.Distinguisher
import Apile.Testing.Batch
import Testing

type Domain   = (Int, Term)
type Codomain = (Int, Term)

oes = [
    (uglyNE 0 "i"        , uglyNE 0 "i"        ),
    (uglyNE 0 "^p^qp"    , uglyNE 2 "^0^10"    ),
    (uglyNE 0 "·^pb^qd"  , uglyNE 2 "·^0b^1d"  ),
    (uglyNE 0 ">st"      , uglyNE 0 ">st"      ),
    (uglyNE 0 ";:f^pb^qd", uglyNE 2 ";:f^0b^1d"),
    (uglyNE 0 ";<f>pb>qd", uglyNE 0 ";<f>pb>qd")
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map distinguishing oris) :: [Codomain]
main = useNeither (map prettyNE oris) (map prettyNE exps) (map prettyNE acts)

--
