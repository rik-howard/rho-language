
module Functional.Distinguisher where

    import Collectional.Term
    import Functional.Substitutor

    distinguishing :: (Int,  Term) -> (Int, Term)
    distinguishing (n, e) =
        case e of
            Idn s           -> idnD n s
            Abn p b         -> abnD n p b
            Apn f a         -> apnD n f a
            Trn s t         -> trnD n s t
            Cpn (Ain v u) k -> cinD n v u k
            Cpn (Ayn v w) k -> cynD n v w k

--

    idnD :: Int -> String -> (Int, Term)
    idnD n s = (n, Idn s)

    abnD :: Int -> Term -> Term -> (Int, Term)
    abnD n p b =
        let
            new        = Idn (show n)
            (n' , b' ) = (n + 1, substitution (new, p, b))
            (n'', b'') = distinguishing (n', b')
        in (n'', Abn new b'')

    apnD :: Int -> Term -> Term -> (Int, Term)
    apnD n f a =
        let
            (n' , f') = distinguishing (n , f)
            (n'', a') = distinguishing (n', a)
        in (n'', Apn f' a')

    trnD :: Int -> Term -> Term -> (Int, Term)
    trnD n s t =
        let
            (n' , s') = distinguishing (n , s)
            (n'', t') = distinguishing (n', t)
        in (n'', Trn s' t')

    cinD :: Int -> Term -> Term -> Term -> (Int, Term)
    cinD n v u k =
        let
            (n' , u') = distinguishing (n , u)
            (n'', k') = distinguishing (n', k)
        in (n'', Cpn (Ain v u') k')

    cynD :: Int -> Term -> Term -> Term -> (Int, Term)
    cynD n v w k =
        let
            (n' , w') = distinguishing (n , w)
            (n'', k') = distinguishing (n', k)
        in (n'', Cpn (Ayn v w') k')

--
