
module Functional.Regulator where

    import Collectional.Term

    regulating :: (Int,  Term) -> (Int, Term)
    regulating (n, e) =
        case e of
            Idn s           -> idnG  n s
            Abn p b         -> abnG  n p b
            Apn f (Idn s)   -> apnG0 n f s
            Apn f a         -> apnG1 n f a
            Trn s t         -> trnG  n s t
            Cpn (Ain v u) k -> cinG  n v u k
            Cpn (Ayn v w) k -> cynG  n v w k

--

    idnG :: Int -> String -> (Int, Term)
    idnG n s = (n, Idn s)

    abnG :: Int -> Term -> Term -> (Int, Term)
    abnG n p b =
        let (n', b') = regulating (n, b)
        in (n', Abn p b')

    apnG0 :: Int -> Term -> String -> (Int, Term)
    apnG0 n f s =
        let (n', f') = regulating (n, f)
        in (n', Apn f' (Idn s))

    apnG1 :: Int -> Term -> Term -> (Int, Term)
    apnG1 n f a =
        let
            (n' , a') = regulating (n , a)
            (n'', f') = regulating (n', f)
            new       = Idn (show n'')
        in (n'' + 1, Cpn (Ain new a') (Apn f' new))

    trnG :: Int -> Term -> Term -> (Int, Term)
    trnG n s t =
        let
            (n' , s') = regulating (n , s)
            (n'', t') = regulating (n', t)
        in (n'', Trn s' t')

    cinG :: Int -> Term -> Term -> Term -> (Int, Term)
    cinG n v u k =
        let
            (n' , u') = regulating (n , u)
            (n'', k') = regulating (n', k)
        in (n'', Cpn (Ain v u') k')

    cynG :: Int -> Term -> Term -> Term -> (Int, Term)
    cynG n v w k =
        let
            (n' , w') = regulating (n , w)
            (n'', k') = regulating (n', k)
        in (n'', Cpn (Ayn v w') k')

--
