
import Collectional.Heap
import Collectional.Term
import Functional.Reducer
import Apile.Testing.Batch
import Testing

type Domain   = (Int, Heap, Term)
type Codomain = (Int, Heap, Term)

oes = [
    (uglyNHE 0 ";:i^pbø i"        , uglyNHE 1 ";:i^pbø ^0b"    ),
    (uglyNHE 0 ";:i·^oo^pbø i"    , uglyNHE 0 ";:i^pbø i"      ),
    (uglyNHE 0 ";:jw;:i^pbø i"    , uglyNHE 1 ";:jw;:i^pbø ^0b"),
    (uglyNHE 0 "          ø ^ib"  , uglyNHE 0 "      ø ^ib"    ),
    (uglyNHE 0 "          ø ·^ooa", uglyNHE 0 "      ø a"      ),
    (uglyNHE 0 "    ;:f^pbø ·fa"  , uglyNHE 1 ";:f^pbø ·^0ba"  ),
    (uglyNHE 0 "          ø ;:iuk", uglyNHE 0 "  ;:iuø k"      )
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map reduction oris) :: [Codomain]
main = useNeither (map prettyNHE oris) (map prettyNHE exps) (map prettyNHE acts)

--
