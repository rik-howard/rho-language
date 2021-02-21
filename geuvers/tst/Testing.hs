
module Testing where

    import Collectional.Term
    import Collectional.Heap
    import Apile.Base.Core
    import Data.List

--

    uglyNHE :: Int -> String -> (Int, Heap, Term)
    uglyNHE n x =
        let
            (x' , h) = enheaping x
            (x'', e) = enterming x'
        in (n, h, e)

    uglyNE :: Int -> String -> (Int, Term)
    uglyNE n x =
        let (x', e) = enterming x
        in (n, e)

    uglyEEE :: String -> (Term, Term, Term)
    uglyEEE x =
        let
            (x'  , n) = enterming x
            (x'' , o) = enterming x'
            (x''', e) = enterming x''
        in (n, o, e)

    uglyE :: String -> Term
    uglyE x =
        let (x', e) = enterming x
        in e

    uglyNHEY :: Int -> String -> (Int, Heap, Term, Term)
    uglyNHEY n x =
        let
            (x'  , h) = enheaping x
            (x'' , e) = enterming x'
            (x''', y) = enterming x''
        in (n, h, e, y)

    uglyHYE :: String -> (Heap, Term, Term)
    uglyHYE x =
        let
            (x'  , h) = enheaping x
            (x'' , y) = enterming x'
            (x''', e) = enterming x''
        in (h, y, e)

    uglyEs :: String -> [Term]
    uglyEs x = uglyEs' x []
    uglyEs' "" es = es
    uglyEs' x es =
        let (x', e') = enterming x
        in uglyEs' x' (entailing es e')

    uglyH :: String -> Heap
    uglyH x =
        let (x', h) = enheaping x
        in h

    uglyEEs :: String -> [(Term, Term)]
    uglyEEs x = uglyEEs' x []
    uglyEEs' "" ees = ees
    uglyEEs' x ees =
        let
            (x' , e' ) = enterming x
            (x'', e'') = enterming x'
        in uglyEEs' x'' (entailing ees (e', e''))

    uglyES :: String -> (Term, [(Term, Term)])
    uglyES x =
        let
            (x', e) = enterming x
            h = uglyEEs x'
        in (e, h)

--

    prettyNHE :: (Int, Heap, Term) -> String
    prettyNHE (n, h, e) = show n ++ " " ++ prettyH h ++ " " ++ prettyE e

    prettyNE :: (Int, Term) -> String
    prettyNE (n, e) = show n ++ " " ++ prettyE e

    prettyH :: Heap -> String
    prettyH Emn = "ø"
    prettyH (Cpn (Ain v u) h) = ";:" ++ prettyE v ++ prettyE u ++ prettyH h
    prettyH (Cpn (Ayn w y) h) = ";<" ++ prettyE w ++ prettyE y ++ prettyH h

    prettyEEE :: (Term, Term, Term) -> String
    prettyEEE (n, o, e) = prettyE n ++ " " ++ prettyE o ++ " " ++ prettyE e

    prettyE :: Term -> String
    prettyE (Abn p b) = "^" ++ prettyE p ++ prettyE b
    prettyE (Apn f a) = "·" ++ prettyE f ++ prettyE a
    prettyE (Trn s t) = ">" ++ prettyE s ++ prettyE t
    prettyE (Ain v u) = ":" ++ prettyE v ++ prettyE u
    prettyE (Cpn (Ain v u) k) = ";:" ++ prettyE v ++ prettyE u ++ prettyE k
    prettyE (Cpn (Ayn w y) k) = ";<" ++ prettyE w ++ prettyE y ++ prettyE k
    prettyE (Idn s) = s

    prettyNHYE :: (Int, Heap, Term, Term) -> String
    prettyNHYE (n, h, y, e) = show n ++ " " ++ prettyH h ++ " " ++ prettyE y ++ " " ++ prettyE e

    prettyHEE :: (Heap, Term, Term) -> String
    prettyHEE (h, y, e) = prettyH h ++ " " ++ prettyE y ++ " " ++ prettyE e

    prettyEs :: [Term] -> String
    prettyEs es = intercalate " " (map prettyE es)

    prettyEE :: (Term, Term) -> String
    prettyEE (e, o) = prettyE e ++ prettyE o

    prettyEEs :: [(Term, Term)] -> String
    prettyEEs ees = intercalate " " (map prettyEE ees)

--
