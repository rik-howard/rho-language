
import Relational.Typifier
import Apile.Testing.Batch
import Collectional.Term
import Collectional.Heap
import Testing

type Domain   = (Heap, Term, Term)
type Codomain = Bool

oes = [
    (uglyHYE "                ø Y   e"    , False),
    (uglyHYE "            ;<eEø Y   e"    , False),
    (uglyHYE "            ;<eEø E   e"    , True ),
    (uglyHYE "        ;<oO;<eEø E   e"    , True ),
    (uglyHYE "            ;<bBø >PB ^pb"  , True ),
    (uglyHYE "            ;<bBø Y   ^pb"  , False),
    (uglyHYE "      ;<f>AF;<aAø F   ·fa"  , True ),
    (uglyHYE "      ;<f>AF;<aAø Y   ·fa"  , False),
    (uglyHYE ";<g>st;<f>AF;<aAø F   ·fa"  , True ),
    (uglyHYE "  ;<oO;<f>AF;<aAø F   ·fa"  , True ),
    (uglyHYE "                ø F   ·fa"  , False),
    (uglyHYE "                ø F   ;:vuk", True )
    ] :: [(Domain, Codomain)]

oris = (map fst oes) :: [Domain]
exps = (map snd oes) :: [Codomain]
acts = (map isTypical oris) :: [Codomain]
main = useRight (map prettyHEE oris) exps acts

--
