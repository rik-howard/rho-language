
import Collectional.Term
import Functional.Regulator
import Apile.Testing.Batch
import Testing

type Domain   = (Int, Term)
type Codomain = (Int, Term)

oes = [
    (uglyNE 0 "i"            , uglyNE 0 "i"                      ),
    (uglyNE 1 "^0·f·gc"      , uglyNE 2 "^0;:1·gc·f1"            ),
    (uglyNE 0 "··f·gci"      , uglyNE 1 "·;:0·gc·f0i"            ),
    (uglyNE 0 "··f·gc·h·ko"  , uglyNE 3 ";:2;:0·ko·h0·;:1·gc·f12"),
    (uglyNE 0 ">·f·gc·h·ko"  , uglyNE 2 ">;:0·gc·f0;:1·ko·h1"    ),
    (uglyNE 0 ";:v·f·gc·h·ko", uglyNE 2 ";:v;:0·gc·f0;:1·ko·h1"  ),
    (uglyNE 0 ";<v·f·gc·h·ko", uglyNE 2 ";<v;:0·gc·f0;:1·ko·h1"  )
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map regulating oris) :: [Codomain]
main = useNeither (map prettyNE oris) (map prettyNE exps) (map prettyNE acts)

--
