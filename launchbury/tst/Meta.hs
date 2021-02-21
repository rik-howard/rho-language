
module Meta where

    import Collectional.Term
    import Collectional.Heap
    import Data.List

    isDistinctlyNamed :: (Heap, Term) -> Bool
    isDistinctlyNamed (h, t) =
        let
            pz = paramz h ++ paramz t
            fz = frevez h ∪ frevez t
            z  = pz ++ fz
        in nub z == z

    paramz :: Term -> [Term]
    paramz (Idn s)           = []
    paramz (Abn p b)         = [p] ++ paramz b
    paramz (Apn f a)         = paramz f ++ paramz a
    paramz (Cpn (Ain v u) k) = paramz u ++ paramz k

    frevez :: Term -> [Term]
    frevez (Idn s)           = [Idn s]
    frevez (Abn p b)         = frevez b ∖ [p]
    frevez (Apn f a)         = frevez f ∪ frevez a
    frevez (Cpn (Ain v u) k) = frevez v ∪ frevez u ∪ frevez k

--
