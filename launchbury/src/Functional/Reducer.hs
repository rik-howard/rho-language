
module Functional.Reducer where

    import Collectional.Heap
    import Collectional.Term
    import Relational.Informer
    import Functional.Substitutor
    import Functional.Distinguisher

    reduction :: (Int, Heap, Term) -> (Int, Heap, Term)
    reduction (n, h, e) =
        case e of
            Idn x           -> idnR  n h x
            Abn p b         -> abnR  n h p b
            Apn (Abn p b) a -> apnR0 n h p b a
            Apn f a         -> apnR1 n h f a
            Cpn (Ain v u) k -> canR  n h v u k

--

    idnR :: Int -> Heap -> String -> (Int, Heap, Term)
    idnR n Emn x = error ("error: unassigned variable: " ++ x)
    idnR n (Cpn (Ain v u) h) x
        | v == Idn x = idnR' n v u h x
        | otherwise = idnR'' n v u h x

    idnR' :: Int -> Term -> Term -> Heap -> String -> (Int, Heap, Term)
    idnR' n v u h x
        | isNF u = idnR''' n v u h x
        | otherwise = idnR'''' n v u h x

    idnR'' :: Int -> Term -> Term -> Heap -> String -> (Int, Heap, Term)
    idnR'' n v u h x =
        let (n', h', t') = idnR n h x
        in (n', Cpn (Ain v u) h', t')

    idnR''' :: Int -> Term -> Term -> Heap -> String -> (Int, Heap, Term)
    idnR''' n v u h x =
        let (n', u') = distinguishing (n, u)
        in (n', Cpn (Ain v u) h, u')

    idnR'''' :: Int -> Term -> Term -> Heap -> String -> (Int, Heap, Term)
    idnR'''' n v u h x =
        let (n', h', u') = reduction (n, h, u)
        in (n', Cpn (Ain v u') h', Idn x)

--

    abnR :: Int -> Heap -> Term -> Term -> (Int, Heap, Term)
    abnR n h p b = (n, h, Abn p b)

    apnR0 :: Int -> Heap -> Term -> Term -> Term -> (Int, Heap, Term)
    apnR0 n h p b a = (n, h, substitution (a, p, b))

    apnR1 :: Int -> Heap -> Term -> Term -> (Int, Heap, Term)
    apnR1 n h f a =
        let (n', h', f') = reduction (n, h, f)
        in (n', h', Apn f' a)

    canR :: Int -> Heap -> Term -> Term -> Term -> (Int, Heap, Term)
    canR n h v u k = (n, Cpn (Ain v u) h, k)

--
