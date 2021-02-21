
module Testing where

    import Collectional.Term
    import Collectional.Heap

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
        let
            (x', e) = enterming x
        in e

--

    prettyNHE :: (Int, Heap, Term) -> String
    prettyNHE (n, h, e) = show n ++ " " ++ prettyH h ++ " " ++ prettyE e

    prettyNE :: (Int, Term) -> String
    prettyNE (n, e) = show n ++ " " ++ prettyE e

    prettyH :: Heap -> String
    prettyH Emn = "ø"
    prettyH (Cpn (Ain v u) h) = ";:" ++ prettyE v ++ prettyE u ++ prettyH h

    prettyEEE :: (Term, Term, Term) -> String
    prettyEEE (n, o, e) = prettyE n ++ " " ++ prettyE o ++ " " ++ prettyE e

    prettyE :: Term -> String
    prettyE (Abn p b) = "^" ++ prettyE p ++ prettyE b
    prettyE (Apn f a) = "·" ++ prettyE f ++ prettyE a
    prettyE (Cpn (Ain v u) k) = ";:" ++ prettyE v ++ prettyE u ++ prettyE k
    prettyE (Idn x) = x

--
